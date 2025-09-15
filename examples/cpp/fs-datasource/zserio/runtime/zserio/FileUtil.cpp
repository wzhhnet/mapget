#include <fstream>
#include <string_view>

#include "zserio/CppRuntimeException.h"
#include "zserio/FileUtil.h"

namespace zserio
{

void writeBufferToFile(const uint8_t* buffer, size_t bitSize, BitsTag, std::string_view fileName)
{
    std::ofstream stream(fileName.data(), std::ofstream::binary | std::ofstream::trunc);
    if (!stream)
    {
        throw CppRuntimeException("writeBufferToFile: Failed to open '") << fileName << "' for writing!";
    }

    const size_t byteSize = (bitSize + 7) / 8;
    if (!stream.write(reinterpret_cast<const char*>(buffer), static_cast<std::streamsize>(byteSize)))
    {
        throw CppRuntimeException("writeBufferToFile: Failed to write '") << fileName << "'!";
    }
}

BitBuffer readBufferFromFile(std::string_view fileName)
{
    std::ifstream stream(fileName.data(), std::ifstream::binary);
    if (!stream)
    {
        throw CppRuntimeException("readBufferFromFile: Cannot open '") << fileName << "' for reading!";
    }

    (void)stream.seekg(0, stream.end);
    const std::streampos fileSize = stream.tellg();
    (void)stream.seekg(0);

    if (static_cast<int>(fileSize) == -1)
    {
        throw CppRuntimeException("readBufferFromFile: Failed to get file size of '") << fileName << "'!";
    }

    const size_t sizeLimit = std::numeric_limits<size_t>::max() / 8;
    if (static_cast<uint64_t>(fileSize) > sizeLimit)
    {
        throw CppRuntimeException("readBufferFromFile: File size exceeds limit '") << sizeLimit << "'!";
    }

    BitBuffer bitBuffer(static_cast<size_t>(fileSize) * 8);
    if (!stream.read(reinterpret_cast<char*>(bitBuffer.getBuffer()),
                static_cast<std::streamsize>(bitBuffer.getByteSize())))
    {
        throw CppRuntimeException("readBufferFromFile: Failed to read '") << fileName << "'!";
    }

    return bitBuffer;
}

} // namespace zserio

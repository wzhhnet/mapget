#include "fs_datasource.h"

using namespace mapget;
int main(int argc, char **argv)
{
    int port = (argc > 1) ? std::stoi(argv[1])
                          : 0; // get port from command line argument
    log().info("Running on port {}", port);
    std::string fs = "/var/tmp/nmap/mx/686306/4e78806b-3b1a-4c3b-a357-03a3f0327b7f/tile.ndslive";
    FileStoreDataSource ds(fs, port);
    ds.run();
    return 0;
}
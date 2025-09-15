/*!

# Smart Layer Statistics

This package defines structures to track statistics about
`SmartLayerTileService`, `SmartLayerObjectService`, and `SmartLayerPathService`
RPC calls, which are distributed and updated via the corresponding topics.

**Dependencies**

!*/

package smart.stats;

/*!

## ServerStatsTopic Message

The `ServerStatsTopic` message is used to track server-side network statistics.

__Note:__
The values in the message are always cumulative as of server startup.

!*/

/** Used to track server-side network statistics. */
struct ServerStatsTopic
{
  /** Total number of requests received.*/
  optional varuint requestNumReceived;
  /** Total request payload size received.*/
  optional varuint requestPayloadBytes;
  /** Average request payload size in bytes.*/
  optional float32 requestAvgPayloadBytes;
  /** Average time from receiving a request to sending the response.*/
  optional float32 avgTimeRequestToResponse;
  /** Total number of responses sent since startup.*/
  optional varuint responseNumSent;
  /** Total payload size in bytes sent to all clients.*/
  optional varuint responsePayloadBytes;
  /** Average response payload in bytes sent.*/
  optional float32 responseAvgPayloadBytes;
};

/*!

## ClientStatsTopic Message

The `ClientStatsTopic` message is used to track client-side network statistics.

__Note:__
The values in the message are always cumulative as of client startup.

!*/

/** Used to track client-side network statistics. */
struct ClientStatsTopic
{
  /** Total number of requests sent to the server.*/
  optional varuint requestNumSent;
  /** Total payload size in bytes sent to the server.*/
  optional varuint requestPayloadBytes;
  /** Average response time of the server.*/
  optional float32 avgResponseTimeServer;
  /** Total number of responses received.*/
  optional varuint responseNumReceived;
  /** Total payload size in bytes received from server.*/
  optional varuint responsePayloadBytes;
  /** Average payload size in bytes of all responses received.*/
  optional float32 responseAvgPayloadBytes;
};

pubsub SmartStatsTopicCollection
{
  /*!

  ## serverStats Topic

  The `serverStats` topic is the actual publish/subscribe topic for the
  `ServerStatsTopic` message. A subscriber can specify one wildcard to
  subscribe to statistics from a single server or leave it unspecified to
  subscribe to statistics from all servers.

  !*/

  topic("nds/service/server/+/stats") ServerStatsTopic serverStats;

  /*!

  ## clientStats Topic

  The `clientStats` topic is the actual publish/subscribe topic for the
  `ClientStatsTopic` message. A subscriber can specify one wildcard to
  subscribe to statistics from a single client or leave it unspecified to
  subscribe to statistics from all clients.

  !*/

  topic ("nds/service/client/+/stats") ClientStatsTopic clientStats;
};

## Special Block Functions

```block.blockhash(uint blockNumber)``` hash of given block (256 most recent)

```block.coinbase(address)``` current block miner addres

```block.difficulty(uint)``` current block difficulty

```block.gaslimit(uint)``` current block gaslimit

```block.number(uint)``` current block number

```block.timestamp(uint)``` current block timestamp as seconds since unix epoch

## Special Transaction Functions

```msg.data(bytes)``` complete calldata

```msg.gas(uint)``` remaining gas

```msg.sender(address)``` sender of the message (current call only)

```msg.sig(bytes4)``` function identifier

```msg.value(uint)``` number of wei sent with message

```now(uint)``` current block timestamp 

```tx.gasprice(uint)```  gas price of the transaction

```tx.origin(address)``` sender of the transaction (full call chain)

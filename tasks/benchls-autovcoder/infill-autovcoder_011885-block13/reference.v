module autovcoder_011885 #(
    parameter BIT_PER_BYTES = 8,
    parameter BYTES_SIZE = 512
) (
    input sysClk,
    input sysRst,
    input [BIT_PER_BYTES-1:0] in_data,
    input in_data_valid,
    output wire in_data_ready,

    input out_data_ready,
    output reg [BIT_PER_BYTES-1:0] out_data,
    output wire out_data_valid,

    output wire [10:0] fillLevel,
    output wire full,
    output wire empty
);
  reg [8:0] pHead;  //full Head reg  [8:0]pTail;//empty Tail
  reg [8:0] pTail;  //full Head reg  [8:0]pTail;//empty Tail
  integer ntIter;
  reg writeLock;

  reg [BIT_PER_BYTES-1:0] rf[BYTES_SIZE-1:0];  //add prohibit bit

  reg [10:0] tBytesCounter;
  assign full = (tBytesCounter == 511);
  assign empty = (tBytesCounter == 0);
  assign fillLevel = tBytesCounter;
  assign out_data_valid = (~empty) & (~writeLock);
  assign in_data_ready = (~full);

  always @(posedge sysClk or posedge sysRst) begin
    if (sysRst) begin
      pHead <= 0;
      pTail <= 0;
      tBytesCounter <= 0;
    end else begin
      if (in_data_valid && in_data_ready) begin
        pTail <= pTail + 1;
        rf[pTail] <= in_data;
        tBytesCounter <= tBytesCounter + 1;
        writeLock = 1;
      end else writeLock = 0;

      if (out_data_ready && out_data_valid) begin
        pHead <= pHead + 1;
        out_data <= rf[pHead];
        tBytesCounter <= tBytesCounter - 1;
      end
    end
  end

endmodule


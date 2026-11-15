module autovcoder_070103 (
    input clk,
    input rst,
    input [9:0] addr,
    output reg match
);
  always @(posedge clk) begin
    casex (addr)
      10'b1000011010: match <= 1'b1;
      10'b1000011011: match <= 1'b1;
      10'b1000011111: match <= 1'b1;
      10'b1000101000: match <= 1'b1;
      10'b1000101001: match <= 1'b1;
      10'b1000101010: match <= 1'b1;
      10'b1000101011: match <= 1'b1;
      10'b1000101100: match <= 1'b1;
      10'b1000101101: match <= 1'b1;
      10'b1000101110: match <= 1'b1;
      10'b1000101111: match <= 1'b1;
      10'b100001000?: match <= 1'b1;
      10'b100001001?: match <= 1'b1;
      10'b100001100?: match <= 1'b1;
      10'b10000101??: match <= 1'b1;
      10'b10001110??: match <= 1'b1;
      10'b10001111??: match <= 1'b1;
      10'b1000100???: match <= 1'b1;
      10'b1000110???: match <= 1'b1;
      10'b1100000???: match <= 1'b1;
      10'b1100001???: match <= 1'b1;
      10'b1100100???: match <= 1'b1;
      10'b1100101???: match <= 1'b1;
      10'b1100111???: match <= 1'b1;
      10'b100000????: match <= 1'b1;
      10'b10010?????: match <= 1'b1;
      10'b10011?????: match <= 1'b1;
      10'b0100??????: match <= 1'b1;
      10'b0101??????: match <= 1'b1;
      10'b1010??????: match <= 1'b1;
      10'b1011??????: match <= 1'b1;
      10'b1101??????: match <= 1'b1;
      10'b000???????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b111???????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if (rst) match <= 1'b0;
  end
endmodule


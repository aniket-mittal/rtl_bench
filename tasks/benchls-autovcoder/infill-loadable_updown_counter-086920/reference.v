module autovcoder_086920 (
    MR,
    NoLoad,
    EN,
    Dn,
    CLK,
    D,
    Q,
    CO
);
  input MR, NoLoad, EN, Dn, CLK;
  input [3:0] D;
  wire MR, NoLoad, EN, Dn, CLK;
  wire [3:0] D;
  output [3:0] Q;
  output CO;
  reg [3:0] Q;
  reg CO;
  always @(posedge CLK or posedge MR)
    if (MR == 1) begin
      Q  <= 0;  //첽
      CO <= 0;
    end else if (NoLoad == 0) begin
      Q  <= D;  //װ
      CO <= 0;
    end else begin
      if ({EN, Dn} == 2'b10) //һ
		begin
        if (Q == 15) begin
          Q  <= 0;
          CO <= 1;
        end else begin
          Q  <= Q + 1;
          CO <= 0;
        end
      end else if ({EN, Dn} == 2'b11) //һ
		begin
        if (Q == 1) begin
          Q  <= 0;
          CO <= 1;
        end else begin
          Q  <= Q - 1;
          CO <= 0;
        end
      end else begin
        Q  <= Q;  //
        CO <= CO;
      end
    end
endmodule


module FL1P3DX_FUNC (
  input  D0, D1, SP, CK, SD, CD, SR,
  output reg Q,
  input  notifier
);

  always @ (posedge CK or posedge SR) begin
    if (SR)
      Q <= 1'b0;
    else if (CD)
      Q <= 1'b0;
    else if (SD)
      Q <= D1;
    else if (SP)
      Q <= D0;
  end

endmodule
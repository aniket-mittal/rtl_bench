module autovcoder_002520 (
    D,
    x,
    y,
    z
);  //8x3 encoder using RTL

  input wire [7:0] D;
  output reg x, y, z;


  always @(D) begin
    if (D[0] == 1) begin
      x <= 0;
      y <= 0;
      z <= 0;
    end else if (D[1] == 1) begin
      x <= 0;
      y <= 0;
      z <= 1;
    end else if (D[2] == 1) begin
      x <= 0;
      y <= 1;
      z <= 0;
    end else if (D[3] == 1) begin
      x <= 0;
      y <= 1;
      z <= 1;
    end else if (D[4] == 1) begin
      x <= 1;
      y <= 0;
      z <= 0;
    end else if (D[5] == 1) begin
      x <= 1;
      y <= 0;
      z <= 1;
    end else if (D[6] == 1) begin
      x <= 1;
      y <= 1;
      z <= 0;
    end else if (D[7] == 1) begin
      x <= 1;
      y <= 1;
      z <= 1;
    end
  end

endmodule


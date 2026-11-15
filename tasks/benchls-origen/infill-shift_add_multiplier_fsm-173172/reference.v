module origen_173172(
  input [3:0] a,
  input [3:0] b,
  input clock,
  input _reset,
  input _dav,
  output [5:0] p,
  output rfd
);

  reg [3:0] A, B;
  reg [5:0] P;
  reg RFD;
  reg [1:0] STAR;

  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

  always @(posedge clock or negedge _reset) begin
    if (!_reset) begin
      P <= 6'b0;
      RFD <= 1'b1;
      STAR <= S0;
      A <= 4'b0;
      B <= 4'b0;
    end else begin
      case (STAR)
        S0: begin
          if (_dav) begin
            STAR <= S1;
          end
        end
        S1: begin
          A <= a;
          B <= b;
          RFD <= 1'b0;
          STAR <= S2;
        end
        S2: begin
          if (_dav) begin
            STAR <= S3;
          end
        end
        S3: begin
          P <= 2 * (A + B);
          RFD <= 1'b1;
          STAR <= S0;
        end
      endcase
    end
  end

  assign p = P;
  assign rfd = RFD;

endmodule
module ad_addsub #(

  parameter   A_DATA_WIDTH = 32,
  parameter   B_DATA_VALUE = 32'h1,
  parameter   ADD_OR_SUB_N = 0
) (
  input                   clk,
  input       [(A_DATA_WIDTH-1):0]  A,
  input       [(A_DATA_WIDTH-1):0]  Amax,
  output  reg [(A_DATA_WIDTH-1):0]  out,
  input                   CE
);

  localparam  ADDER = 1;
  localparam  SUBSTRACTER = 0;

  // registers

  reg     [A_DATA_WIDTH:0]       out_d = 'b0;
  reg     [A_DATA_WIDTH:0]       out_d2 = 'b0;
  reg     [(A_DATA_WIDTH-1):0]   A_d = 'b0;
  reg     [(A_DATA_WIDTH-1):0]   Amax_d = 'b0;
  reg     [(A_DATA_WIDTH-1):0]   Amax_d2 = 'b0;

  // constant regs

  reg     [(A_DATA_WIDTH-1):0]   B_reg = B_DATA_VALUE;

  // latch the inputs

  always @(posedge clk) begin
      A_d <= A;
      Amax_d <= Amax;
      Amax_d2 <= Amax_d;
  end

  // ADDER/SUBSTRACTER

  always @(posedge clk) begin
    if ( ADD_OR_SUB_N == ADDER ) begin
      out_d <= A_d + B_reg;
    end else begin
      out_d <= A_d - B_reg;
    end
  end

  // Resolve

  always @(posedge clk) begin
    if ( ADD_OR_SUB_N == ADDER ) begin
      if ( out_d > Amax_d2 ) begin
        out_d2 <= out_d - Amax_d2;
      end else begin
        out_d2 <= out_d;
      end
    end else begin // SUBSTRACTER
      if ( out_d[A_DATA_WIDTH] == 1'b1 ) begin
        out_d2 <= Amax_d2 + out_d;
      end else begin
        out_d2 <= out_d;
      end
    end
  end

  // output logic

  always @(posedge clk) begin
    if ( CE ) begin
      out <= out_d2;
    end else begin
      out <= 'b0;
    end
  end

endmodule
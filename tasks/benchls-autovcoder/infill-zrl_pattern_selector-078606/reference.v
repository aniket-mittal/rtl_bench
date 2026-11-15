module autovcoder_078606 #(
    parameter NUM_PATTERNS = 8,
    parameter NUM_FIRST_TRANSFORMER = 2,
    parameter NUM_LAST_TRANSFORMER = 6
) (
    input wire                                                        isAllZero_i,
    input wire                                                        isAllWordSame_i,
    input wire [4*(NUM_LAST_TRANSFORMER-NUM_FIRST_TRANSFORMER+1)-1:0] zeroRunLen_i,

    output wire [$clog2(NUM_PATTERNS)-1:0] select_o
);
  // synopsys template
  localparam NUM_TRANSFORMER = NUM_LAST_TRANSFORMER - NUM_FIRST_TRANSFORMER + 1;
  localparam LEN_ENCODE = $clog2(NUM_PATTERNS);

  // rename input
  wire [3:0] zeroRunLen[NUM_FIRST_TRANSFORMER:NUM_LAST_TRANSFORMER];
  genvar i;
  generate
    for (i = NUM_FIRST_TRANSFORMER; i <= NUM_LAST_TRANSFORMER; i = i + 1) begin : input_rename
      assign zeroRunLen[i] = zeroRunLen_i[4*(NUM_TRANSFORMER-(i-NUM_FIRST_TRANSFORMER)) - 1 : 4*(NUM_TRANSFORMER-(i-NUM_FIRST_TRANSFORMER+1))];
    end
  endgenerate

  reg [LEN_ENCODE-1:0] select;

  integer j;
  integer max;
  always @(*) begin
    max = 0;
    select = NUM_PATTERNS - 1;
    if (isAllZero_i) begin
      select = 'd0;
    end else if (isAllWordSame_i) begin
      select = 'd1;
    end else begin
      // check max zrl
      for (j = NUM_FIRST_TRANSFORMER; j <= NUM_LAST_TRANSFORMER; j = j + 1) begin
        if (zeroRunLen[j] >= max) begin
          max = zeroRunLen[j];
          select = j;
        end
      end
    end
  end

  // assign output
  assign select_o = select;
endmodule


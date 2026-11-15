module rtlpp_05050 (
  input               rst,
  input               clk,

  output      [31:0]  debug,

  input               i_cmd_write_stb,
  input               i_cmd_read_stb,
  input       [7:0]   i_cmd_data,
  output  reg [7:0]   o_cmd_data,
  input               i_enable,
  input               i_cmd_parameter,
  output  reg         o_cmd_finished,

  output              o_cmd_mode,
  output  reg         o_write,
  output  reg         o_read,
  output  reg [7:0]   o_data_out,
  input       [7:0]   i_data_in,
  output  reg         o_data_out_en
);

localparam  IDLE      = 4'h0;
localparam  READ_WAIT = 4'h1;
localparam  FINISHED  = 4'h2;

reg [3:0] state;

assign o_cmd_mode = i_cmd_parameter;

always @ (posedge clk or posedge rst) begin
  if (rst) begin
    state          <= IDLE;
    o_data_out_en  <= 0;
    o_data_out     <= 0;
    o_cmd_finished <= 0;
    o_cmd_data     <= 0;

    o_write        <= 0;
    o_read         <= 0;
  end else begin
    o_cmd_finished <= 0;

    case (state)
      IDLE: begin
        o_write        <= 0;
        o_read         <= 0;

        o_data_out_en  <= 0;
        if (i_cmd_write_stb) begin
          o_data_out_en <= 1;
          o_data_out    <= i_cmd_data;
          o_write       <= 1;
          state         <= FINISHED;
        end else if (i_cmd_read_stb) begin
          o_data_out_en <= 0;
          o_read        <= 1;
          state         <= READ_WAIT;
        end
      end
      READ_WAIT: begin
        state         <= FINISHED;
      end
      FINISHED: begin
        o_write       <= 0;
        o_read        <= 0;
        if (!o_data_out_en) begin
          o_cmd_data <= i_data_in;
        end
        o_cmd_finished <= 1;
        state          <= IDLE;
      end
    endcase
  end
end

endmodule
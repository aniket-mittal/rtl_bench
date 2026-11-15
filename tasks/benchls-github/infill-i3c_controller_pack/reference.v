module i3c_controller_pack (
  input         clk,
  input         reset_n,

  input         u32_ready,
  output        u32_valid,
  output [31:0] u32,

  output [11:0] u8_lvl,

  output       u8_ready,
  input        u8_valid,
  input        u8_last,
  input  [7:0] u8
);

  localparam [0:0] SM_GET = 0;
  localparam [0:0] SM_PUT = 1;

  reg [0:0]  sm;
  reg [1:0]  c;
  reg [7:0]  u32_reg [3:0];
  reg [11:0] u8_lvl_reg;
  reg        u8_last_reg;

  always @(posedge clk) begin
    if (!reset_n) begin
      sm <= SM_GET;
      c <= 2'b00;
      u8_last_reg <= 1'b0;
      u8_lvl_reg <= 0;
    end else begin
      case (sm)
        SM_GET: begin
          u8_last_reg <= u8_last;
          if (u8_valid) begin // tick
            u32_reg[3-c] <= u8;
            u8_lvl_reg <= u8_lvl_reg + 1;
            c <= c + 1;
            if (c == 2'b11 | u8_last) begin
              c <= 2'b00;
              sm <= SM_PUT;
            end
          end
        end
        SM_PUT: begin
          if (u32_ready) begin
            sm <= SM_GET;
            if (u8_last_reg) begin
              u8_lvl_reg <= 0;
            end
          end
        end
      endcase
    end
  end

  assign u8_ready = sm == SM_GET & reset_n;
  assign u32_valid = sm == SM_PUT;
  assign u8_lvl = u8_lvl_reg;

  genvar i;
  generate
    for (i=0; i<4; i=i+1) begin: gen_u32
      assign u32[8*i+7:8*i] = u32_reg[3-i];
    end
  endgenerate

endmodule
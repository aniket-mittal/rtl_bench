module dut
(
  input wire i_clk,
  input wire [31:0] i_instr,
  input wire i_ack,
  output wire [31:0] o_instr,
  output reg o_iscomp
);

  localparam OPCODE_LOAD = 7'h03;
  localparam OPCODE_OP_IMM = 7'h13;
  localparam OPCODE_STORE = 7'h23;
  localparam OPCODE_OP = 7'h33;
  localparam OPCODE_LUI = 7'h37;
  localparam OPCODE_BRANCH = 7'h63;
  localparam OPCODE_JALR = 7'h67;
  localparam OPCODE_JAL = 7'h6f;
  reg [31:0] comp_instr;
  reg illegal_instr;
  assign o_instr = (illegal_instr)? i_instr : comp_instr;

  always @(posedge i_clk) begin
    if(i_ack) o_iscomp <= !illegal_instr; 
  end


  always @(*) begin
    comp_instr = i_instr;
    illegal_instr = 1'b0;
    case(i_instr[1:0])
      2'b00: begin
        case(i_instr[15:14])
          2'b00: begin
            comp_instr = { 2'b0, i_instr[10:7], i_instr[12:11], i_instr[5], i_instr[6], 2'b00, 5'h02, 3'b000, 2'b01, i_instr[4:2], { OPCODE_OP_IMM } };
          end
          2'b01: begin
            comp_instr = { 5'b0, i_instr[5], i_instr[12:10], i_instr[6], 2'b00, 2'b01, i_instr[9:7], 3'b010, 2'b01, i_instr[4:2], { OPCODE_LOAD } };
          end
          2'b11: begin
            comp_instr = { 5'b0, i_instr[5], i_instr[12], 2'b01, i_instr[4:2], 2'b01, i_instr[9:7], 3'b010, i_instr[11:10], i_instr[6], 2'b00, { OPCODE_STORE } };
          end
          2'b10: begin
            illegal_instr = 1'b1;
          end
        endcase
      end
      2'b01: begin
        case(i_instr[15:13])
          3'b000: begin
            comp_instr = { { 6{ i_instr[12] } }, i_instr[12], i_instr[6:2], i_instr[11:7], 3'b0, i_instr[11:7], { OPCODE_OP_IMM } };
          end
          3'b001, 3'b101: begin
            comp_instr = { i_instr[12], i_instr[8], i_instr[10:9], i_instr[6], i_instr[7], i_instr[2], i_instr[11], i_instr[5:3], { 9{ i_instr[12] } }, 4'b0, ~i_instr[15], { OPCODE_JAL } };
          end
          3'b010: begin
            comp_instr = { { 6{ i_instr[12] } }, i_instr[12], i_instr[6:2], 5'b0, 3'b0, i_instr[11:7], { OPCODE_OP_IMM } };
          end
          3'b011: begin
            comp_instr = { { 15{ i_instr[12] } }, i_instr[6:2], i_instr[11:7], { OPCODE_LUI } };
            if(i_instr[11:7] == 5'h02) begin
              comp_instr = { { 3{ i_instr[12] } }, i_instr[4:3], i_instr[5], i_instr[2], i_instr[6], 4'b0, 5'h02, 3'b000, 5'h02, { OPCODE_OP_IMM } };
            end 
          end
          3'b100: begin
            case(i_instr[11:10])
              2'b00, 2'b01: begin
                comp_instr = { 1'b0, i_instr[10], 5'b0, i_instr[6:2], 2'b01, i_instr[9:7], 3'b101, 2'b01, i_instr[9:7], { OPCODE_OP_IMM } };
              end
              2'b10: begin
                comp_instr = { { 6{ i_instr[12] } }, i_instr[12], i_instr[6:2], 2'b01, i_instr[9:7], 3'b111, 2'b01, i_instr[9:7], { OPCODE_OP_IMM } };
              end
              2'b11: begin
                case(i_instr[6:5])
                  2'b00: begin
                    comp_instr = { 2'b01, 5'b0, 2'b01, i_instr[4:2], 2'b01, i_instr[9:7], 3'b000, 2'b01, i_instr[9:7], { OPCODE_OP } };
                  end
                  2'b01: begin
                    comp_instr = { 7'b0, 2'b01, i_instr[4:2], 2'b01, i_instr[9:7], 3'b100, 2'b01, i_instr[9:7], { OPCODE_OP } };
                  end
                  2'b10: begin
                    comp_instr = { 7'b0, 2'b01, i_instr[4:2], 2'b01, i_instr[9:7], 3'b110, 2'b01, i_instr[9:7], { OPCODE_OP } };
                  end
                  2'b11: begin
                    comp_instr = { 7'b0, 2'b01, i_instr[4:2], 2'b01, i_instr[9:7], 3'b111, 2'b01, i_instr[9:7], { OPCODE_OP } };
                  end
                endcase
              end
            endcase
          end
          3'b110, 3'b111: begin
            comp_instr = { { 4{ i_instr[12] } }, i_instr[6:5], i_instr[2], 5'b0, 2'b01, i_instr[9:7], 2'b00, i_instr[13], i_instr[11:10], i_instr[4:3], i_instr[12], { OPCODE_BRANCH } };
          end
        endcase
      end
      2'b10: begin
        case(i_instr[15:14])
          2'b00: begin
            comp_instr = { 7'b0, i_instr[6:2], i_instr[11:7], 3'b001, i_instr[11:7], { OPCODE_OP_IMM } };
          end
          2'b01: begin
            comp_instr = { 4'b0, i_instr[3:2], i_instr[12], i_instr[6:4], 2'b00, 5'h02, 3'b010, i_instr[11:7], OPCODE_LOAD };
          end
          2'b10: begin
            if(i_instr[12] == 1'b0) begin
              if(i_instr[6:2] != 5'b0) begin
                comp_instr = { 7'b0, i_instr[6:2], 5'b0, 3'b0, i_instr[11:7], { OPCODE_OP } };
              end else begin
                comp_instr = { 12'b0, i_instr[11:7], 3'b0, 5'b0, { OPCODE_JALR } };
              end
            end else begin
              if(i_instr[6:2] != 5'b0) begin
                comp_instr = { 7'b0, i_instr[6:2], i_instr[11:7], 3'b0, i_instr[11:7], { OPCODE_OP } };
              end else begin
                if(i_instr[11:7] == 5'b0) begin
                  comp_instr = { 32'h00_10_00_73 };
                end else begin
                  comp_instr = { 12'b0, i_instr[11:7], 3'b000, 5'b00001, { OPCODE_JALR } };
                end
              end
            end
          end
          2'b11: begin
            comp_instr = { 4'b0, i_instr[8:7], i_instr[12], i_instr[6:2], 5'h02, 3'b010, i_instr[11:9], 2'b00, { OPCODE_STORE } };
          end
        endcase
      end
      2'b11: illegal_instr = 1'b1;
    endcase
  end


endmodule

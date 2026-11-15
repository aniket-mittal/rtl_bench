// Hidden tests: 5000 cycles of seeded random inputs (seed 3475356703); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 226;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [4:0] i_2;
  reg [2:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [4:0] i_11;
  reg [1:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [31:0] i_16;
  reg [31:0] i_17;
  reg [31:0] i_18;
  reg [31:0] i_19;
  reg [31:0] i_20;
  reg [0:0] i_21;
  reg [31:0] i_22;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_091785 dut (
    .clock(clk),
    .reset(i_0),
    .busywait(i_1),
    .des_register(i_2),
    .Funct3(i_3),
    .rs1(i_4),
    .rs2(i_5),
    .mux_5_sel(i_6),
    .writeEnable(i_7),
    .mux_3_sel(i_8),
    .memWrite(i_9),
    .memRead(i_10),
    .ALUop(i_11),
    .mux_4_sel(i_12),
    .branch(i_13),
    .jump(i_14),
    .mux_1_sel(i_15),
    .PC(i_16),
    .nextPC(i_17),
    .data1(i_18),
    .data2(i_19),
    .mux_2_out(i_20),
    .Insthit(i_21),
    .B_address(i_22),
    .des_register_out(out_dut[225:221]),
    .Funct3_out(out_dut[220:218]),
    .rs1_out(out_dut[217:213]),
    .rs2_out(out_dut[212:208]),
    .mux_5_sel_out(out_dut[207:207]),
    .writeEnable_out(out_dut[206:206]),
    .mux_3_sel_out(out_dut[205:205]),
    .memWrite_out(out_dut[204:204]),
    .memRead_out(out_dut[203:203]),
    .ALUop_out(out_dut[202:198]),
    .mux_4_sel_out(out_dut[197:196]),
    .branch_out(out_dut[195:195]),
    .jump_out(out_dut[194:194]),
    .mux_1_sel_out(out_dut[193:193]),
    .PC_out(out_dut[192:161]),
    .nextPC_out(out_dut[160:129]),
    .data1_out(out_dut[128:97]),
    .data2_out(out_dut[96:65]),
    .mux_2_out_out(out_dut[64:33]),
    .Insthit_out(out_dut[32:32]),
    .B_address_out(out_dut[31:0])
  );
  autovcoder_091785__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .busywait(i_1),
    .des_register(i_2),
    .Funct3(i_3),
    .rs1(i_4),
    .rs2(i_5),
    .mux_5_sel(i_6),
    .writeEnable(i_7),
    .mux_3_sel(i_8),
    .memWrite(i_9),
    .memRead(i_10),
    .ALUop(i_11),
    .mux_4_sel(i_12),
    .branch(i_13),
    .jump(i_14),
    .mux_1_sel(i_15),
    .PC(i_16),
    .nextPC(i_17),
    .data1(i_18),
    .data2(i_19),
    .mux_2_out(i_20),
    .Insthit(i_21),
    .B_address(i_22),
    .des_register_out(out_ref[225:221]),
    .Funct3_out(out_ref[220:218]),
    .rs1_out(out_ref[217:213]),
    .rs2_out(out_ref[212:208]),
    .mux_5_sel_out(out_ref[207:207]),
    .writeEnable_out(out_ref[206:206]),
    .mux_3_sel_out(out_ref[205:205]),
    .memWrite_out(out_ref[204:204]),
    .memRead_out(out_ref[203:203]),
    .ALUop_out(out_ref[202:198]),
    .mux_4_sel_out(out_ref[197:196]),
    .branch_out(out_ref[195:195]),
    .jump_out(out_ref[194:194]),
    .mux_1_sel_out(out_ref[193:193]),
    .PC_out(out_ref[192:161]),
    .nextPC_out(out_ref[160:129]),
    .data1_out(out_ref[128:97]),
    .data2_out(out_ref[96:65]),
    .mux_2_out_out(out_ref[64:33]),
    .Insthit_out(out_ref[32:32]),
    .B_address_out(out_ref[31:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 3475356703;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule

// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03210 dut (
    .opcode(in_vec[6:1]),
    .branch_eq(in_vec[0:0]),
    .if_pc_source(out_vec[11:10]),
    .id_rt_is_source(out_vec[9:9]),
    .ex_imm_command(out_vec[8:8]),
    .ex_alu_src_b(out_vec[7:7]),
    .ex_dst_reg_sel(out_vec[6:6]),
    .ex_alu_op(out_vec[5:4]),
    .mem_read(out_vec[3:3]),
    .mem_write(out_vec[2:2]),
    .wb_mem_to_reg(out_vec[1:1]),
    .wb_reg_write(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h78;
    stim[1] = 7'h76;
    stim[2] = 7'h30;
    stim[3] = 7'h2b;
    stim[4] = 7'h4d;
    stim[5] = 7'h7d;
    stim[6] = 7'h22;
    stim[7] = 7'h7d;
    stim[8] = 7'h14;
    stim[9] = 7'h45;
    stim[10] = 7'h53;
    stim[11] = 7'h5f;
    stim[12] = 7'h7f;
    stim[13] = 7'h26;
    stim[14] = 7'h54;
    stim[15] = 7'h2a;
    stim[16] = 7'h49;
    stim[17] = 7'h4b;
    stim[18] = 7'h4b;
    stim[19] = 7'h12;
    stim[20] = 7'h0e;
    stim[21] = 7'h2d;
    stim[22] = 7'h6e;
    stim[23] = 7'h40;
    stim[24] = 7'h44;
    stim[25] = 7'h64;
    stim[26] = 7'h7b;
    stim[27] = 7'h32;
    stim[28] = 7'h0e;
    stim[29] = 7'h05;
    stim[30] = 7'h5c;
    stim[31] = 7'h01;
    stim[32] = 7'h70;
    stim[33] = 7'h32;
    stim[34] = 7'h1c;
    stim[35] = 7'h57;
    stim[36] = 7'h03;
    stim[37] = 7'h3d;
    stim[38] = 7'h65;
    stim[39] = 7'h35;
    stim[40] = 7'h0c;
    stim[41] = 7'h2c;
    stim[42] = 7'h37;
    stim[43] = 7'h53;
    stim[44] = 7'h51;
    stim[45] = 7'h63;
    stim[46] = 7'h7a;
    stim[47] = 7'h15;
    stim[48] = 7'h0d;
    stim[49] = 7'h59;
    stim[50] = 7'h0e;
    stim[51] = 7'h45;
    stim[52] = 7'h77;
    stim[53] = 7'h33;
    stim[54] = 7'h5e;
    stim[55] = 7'h52;
    stim[56] = 7'h31;
    stim[57] = 7'h61;
    stim[58] = 7'h0f;
    stim[59] = 7'h4b;
    stim[60] = 7'h61;
    stim[61] = 7'h56;
    stim[62] = 7'h26;
    stim[63] = 7'h1f;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h1a1;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h800;
      expv[30] = 12'h000;
      expv[31] = 12'h261;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h1a1;
      expv[35] = 12'h286;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h1a1;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h286;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule

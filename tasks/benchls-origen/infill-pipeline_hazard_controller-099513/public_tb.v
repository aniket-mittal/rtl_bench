// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_099513 dut (
    .clk(clk),
    .reg_a(in_vec[31:27]),
    .reg_b(in_vec[26:22]),
    .reg_wb(in_vec[21:17]),
    .reg_ex(in_vec[16:12]),
    .reg_wb_en(in_vec[11:11]),
    .reg_ex_en(in_vec[10:10]),
    .instr_type(in_vec[9:6]),
    .branch_taken(in_vec[5:5]),
    .reset(in_vec[4:4]),
    .interrupt(in_vec[3:3]),
    .interrupt_flag(in_vec[2:2]),
    .a_read(in_vec[1:1]),
    .b_read(in_vec[0:0]),
    .imem_addr_mux(out_vec[7:7]),
    .fetch_latch_stall(out_vec[6:6]),
    .dec_nop(out_vec[5:5]),
    .dec_int(out_vec[4:4]),
    .pc_inc(out_vec[3:3]),
    .pc_load(out_vec[2:2]),
    .pc_reset(out_vec[1:1]),
    .pc_mux_override(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h25a967fe;
    stim[1] = 32'h77d3b1bc;
    stim[2] = 32'hb29546ac;
    stim[3] = 32'hdf92e9ed;
    stim[4] = 32'h032f7881;
    stim[5] = 32'hdfa6196d;
    stim[6] = 32'hf1617bc7;
    stim[7] = 32'hd5fafa2c;
    stim[8] = 32'hf69b3aae;
    stim[9] = 32'heb80f00b;
    stim[10] = 32'h7dc47045;
    stim[11] = 32'h0943d62d;
    stim[12] = 32'hc15eec44;
    stim[13] = 32'h8fd68361;
    stim[14] = 32'h158ac20b;
    stim[15] = 32'h787efac8;
    stim[16] = 32'hf6b95ec6;
    stim[17] = 32'h2703b96e;
    stim[18] = 32'ha3e4d4ea;
    stim[19] = 32'h5c98bf61;
    stim[20] = 32'h4713dd27;
    stim[21] = 32'h2003aa41;
    stim[22] = 32'hafa4a284;
    stim[23] = 32'h50d8bb8e;
    stim[24] = 32'hec9e6627;
    stim[25] = 32'h7cf67863;
    stim[26] = 32'hfbdbaf47;
    stim[27] = 32'ha6c0d62d;
    stim[28] = 32'h4d39fb2e;
    stim[29] = 32'h31bc0361;
    stim[30] = 32'hed55e8e7;
    stim[31] = 32'haddef04e;
    stim[32] = 32'h190d62c7;
    stim[33] = 32'h9236ef6e;
    stim[34] = 32'h38222362;
    stim[35] = 32'h589a8a87;
    stim[36] = 32'hfa259864;
    stim[37] = 32'h218ff6ef;
    stim[38] = 32'h12adf044;
    stim[39] = 32'h7190624b;
    stim[40] = 32'h21d5de67;
    stim[41] = 32'h2cca0c09;
    stim[42] = 32'h9ff3126e;
    stim[43] = 32'hb284b849;
    stim[44] = 32'h2ac8c6ed;
    stim[45] = 32'h83208324;
    stim[46] = 32'h6360fbe2;
    stim[47] = 32'h735dd443;
    stim[48] = 32'h0a390e25;
    stim[49] = 32'hbbf3d5aa;
    stim[50] = 32'h91061be1;
    stim[51] = 32'hd792fb0d;
    stim[52] = 32'h890110a6;
    stim[53] = 32'hf4a0760f;
    stim[54] = 32'hf17eb7a1;
    stim[55] = 32'hca83c5e1;
    stim[56] = 32'hf4960f44;
    stim[57] = 32'h0b9ba722;
    stim[58] = 32'h36e8d4ca;
    stim[59] = 32'ha0720c87;
    stim[60] = 32'h22ce1d08;
    stim[61] = 32'h70532f83;
    stim[62] = 32'haee5a30c;
    stim[63] = 32'h17653988;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h08;
      expv[1] = 8'h02;
      expv[2] = 8'h02;
      expv[3] = 8'h68;
      expv[4] = 8'h08;
      expv[5] = 8'h08;
      expv[6] = 8'h60;
      expv[7] = 8'h60;
      expv[8] = 8'h5d;
      expv[9] = 8'h08;
      expv[10] = 8'h08;
      expv[11] = 8'h08;
      expv[12] = 8'h60;
      expv[13] = 8'h60;
      expv[14] = 8'h5d;
      expv[15] = 8'h08;
      expv[16] = 8'h08;
      expv[17] = 8'h08;
      expv[18] = 8'h60;
      expv[19] = 8'h60;
      expv[20] = 8'h5d;
      expv[21] = 8'h08;
      expv[22] = 8'h60;
      expv[23] = 8'h0c;
      expv[24] = 8'h08;
      expv[25] = 8'h64;
      expv[26] = 8'h68;
      expv[27] = 8'h08;
      expv[28] = 8'h60;
      expv[29] = 8'h60;
      expv[30] = 8'h5d;
      expv[31] = 8'h08;
      expv[32] = 8'h60;
      expv[33] = 8'h60;
      expv[34] = 8'h5d;
      expv[35] = 8'h08;
      expv[36] = 8'h08;
      expv[37] = 8'h64;
      expv[38] = 8'h68;
      expv[39] = 8'h08;
      expv[40] = 8'h60;
      expv[41] = 8'h0c;
      expv[42] = 8'h08;
      expv[43] = 8'h60;
      expv[44] = 8'h60;
      expv[45] = 8'h5d;
      expv[46] = 8'h08;
      expv[47] = 8'h64;
      expv[48] = 8'h68;
      expv[49] = 8'h08;
      expv[50] = 8'h64;
      expv[51] = 8'h68;
      expv[52] = 8'h08;
      expv[53] = 8'h64;
      expv[54] = 8'h68;
      expv[55] = 8'h08;
      expv[56] = 8'h64;
      expv[57] = 8'h68;
      expv[58] = 8'h08;
      expv[59] = 8'h08;
      expv[60] = 8'h08;
      expv[61] = 8'h08;
      expv[62] = 8'h08;
      expv[63] = 8'h60;
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

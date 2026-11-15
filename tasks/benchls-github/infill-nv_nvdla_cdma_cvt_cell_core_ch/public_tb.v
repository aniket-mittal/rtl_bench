// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  NV_NVDLA_CDMA_CVT_cell_core_chn_alu_in_rsci_chn_alu_in_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[19:19]),
    .chn_alu_in_rsci_oswt(in_vec[18:18]),
    .chn_alu_in_rsci_biwt(in_vec[17:17]),
    .chn_alu_in_rsci_bdwt(in_vec[16:16]),
    .chn_alu_in_rsci_d(in_vec[15:0]),
    .chn_alu_in_rsci_bawt(out_vec[17:17]),
    .chn_alu_in_rsci_wen_comp(out_vec[16:16]),
    .chn_alu_in_rsci_d_mxwt(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h22622;
    stim[1] = 20'h13fa9;
    stim[2] = 20'hf9486;
    stim[3] = 20'hb1099;
    stim[4] = 20'h96eb1;
    stim[5] = 20'he7c53;
    stim[6] = 20'h8a581;
    stim[7] = 20'hc5774;
    stim[8] = 20'h80e0b;
    stim[9] = 20'hb5219;
    stim[10] = 20'hb5eaa;
    stim[11] = 20'ha3d29;
    stim[12] = 20'hfc2e3;
    stim[13] = 20'hd1be9;
    stim[14] = 20'hd7fb3;
    stim[15] = 20'he7909;
    stim[16] = 20'hc0bb0;
    stim[17] = 20'h0ecdd;
    stim[18] = 20'haa09f;
    stim[19] = 20'hf867d;
    stim[20] = 20'hcc948;
    stim[21] = 20'hf4da4;
    stim[22] = 20'hdf104;
    stim[23] = 20'hde743;
    stim[24] = 20'h9aa1a;
    stim[25] = 20'he799a;
    stim[26] = 20'hea9d0;
    stim[27] = 20'ha7ee5;
    stim[28] = 20'hffda4;
    stim[29] = 20'hc81f1;
    stim[30] = 20'hbd602;
    stim[31] = 20'hb3596;
    stim[32] = 20'h954b8;
    stim[33] = 20'hd20bd;
    stim[34] = 20'hb7de4;
    stim[35] = 20'h87a22;
    stim[36] = 20'hcc83a;
    stim[37] = 20'hf7a02;
    stim[38] = 20'h95972;
    stim[39] = 20'ha76cf;
    stim[40] = 20'h8235e;
    stim[41] = 20'hff683;
    stim[42] = 20'hf298a;
    stim[43] = 20'ha3bdb;
    stim[44] = 20'he61f7;
    stim[45] = 20'ha0e72;
    stim[46] = 20'h934d7;
    stim[47] = 20'hb2805;
    stim[48] = 20'h9d175;
    stim[49] = 20'hbeb74;
    stim[50] = 20'h85c50;
    stim[51] = 20'hcaa40;
    stim[52] = 20'hfae4c;
    stim[53] = 20'hd865f;
    stim[54] = 20'hed371;
    stim[55] = 20'h95ba4;
    stim[56] = 20'he2f75;
    stim[57] = 20'he5efd;
    stim[58] = 20'hc7d91;
    stim[59] = 20'hc0b2a;
    stim[60] = 20'hb0749;
    stim[61] = 20'hdfba8;
    stim[62] = 20'hc1b8c;
    stim[63] = 20'hc7932;
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
      expv[0] = 18'h32622;
      expv[1] = 18'h13fa9;
      expv[2] = 18'h39486;
      expv[3] = 18'h31099;
      expv[4] = 18'h16eb1;
      expv[5] = 18'h37c53;
      expv[6] = 18'h37c53;
      expv[7] = 18'h37c53;
      expv[8] = 18'h37c53;
      expv[9] = 18'h37c53;
      expv[10] = 18'h35eaa;
      expv[11] = 18'h33d29;
      expv[12] = 18'h33d29;
      expv[13] = 18'h01be9;
      expv[14] = 18'h07fb3;
      expv[15] = 18'h37909;
      expv[16] = 18'h37909;
      expv[17] = 18'h1ecdd;
      expv[18] = 18'h3a09f;
      expv[19] = 18'h3a09f;
      expv[20] = 18'h0c948;
      expv[21] = 18'h34da4;
      expv[22] = 18'h0f104;
      expv[23] = 18'h0e743;
      expv[24] = 18'h1aa1a;
      expv[25] = 18'h3799a;
      expv[26] = 18'h3799a;
      expv[27] = 18'h3799a;
      expv[28] = 18'h3799a;
      expv[29] = 18'h081f1;
      expv[30] = 18'h3d602;
      expv[31] = 18'h33596;
      expv[32] = 18'h154b8;
      expv[33] = 18'h020bd;
      expv[34] = 18'h37de4;
      expv[35] = 18'h17a22;
      expv[36] = 18'h0c83a;
      expv[37] = 18'h37a02;
      expv[38] = 18'h15972;
      expv[39] = 18'h376cf;
      expv[40] = 18'h376cf;
      expv[41] = 18'h376cf;
      expv[42] = 18'h3298a;
      expv[43] = 18'h33bdb;
      expv[44] = 18'h33bdb;
      expv[45] = 18'h33bdb;
      expv[46] = 18'h33bdb;
      expv[47] = 18'h32805;
      expv[48] = 18'h1d175;
      expv[49] = 18'h3eb74;
      expv[50] = 18'h15c50;
      expv[51] = 18'h0aa40;
      expv[52] = 18'h3ae4c;
      expv[53] = 18'h0865f;
      expv[54] = 18'h3d371;
      expv[55] = 18'h3d371;
      expv[56] = 18'h32f75;
      expv[57] = 18'h32f75;
      expv[58] = 18'h32f75;
      expv[59] = 18'h32f75;
      expv[60] = 18'h32f75;
      expv[61] = 18'h0fba8;
      expv[62] = 18'h01b8c;
      expv[63] = 18'h07932;
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

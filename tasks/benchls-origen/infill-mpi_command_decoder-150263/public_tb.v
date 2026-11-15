// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_150263 dut (
    .i_clk(clk),
    .i_reset(in_vec[25:25]),
    .i_pe_writedata(in_vec[24:16]),
    .i_pe_address(in_vec[15:0]),
    .o_mpi_init_rank(out_vec[10:10]),
    .o_mpi_init_comm_size(out_vec[9:9]),
    .o_mpi_finalize(out_vec[8:8]),
    .o_mpi_send(out_vec[7:7]),
    .o_mpi_recv(out_vec[6:6]),
    .o_mpi_comm_size(out_vec[5:5]),
    .o_mpi_rank(out_vec[4:4]),
    .o_mpi_status(out_vec[3:3]),
    .o_mpi_bad_msg(out_vec[2:2]),
    .o_mpi_bcast(out_vec[1:1]),
    .o_mpi_reduce(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h25b4f88;
    stim[1] = 26'h39d782b;
    stim[2] = 26'h0c50907;
    stim[3] = 26'h048220f;
    stim[4] = 26'h12eb86e;
    stim[5] = 26'h19b5cf9;
    stim[6] = 26'h1ce01fe;
    stim[7] = 26'h04e0916;
    stim[8] = 26'h0d48f59;
    stim[9] = 26'h0ee3166;
    stim[10] = 26'h0a6c7af;
    stim[11] = 26'h12f8b03;
    stim[12] = 26'h0639227;
    stim[13] = 26'h17ce86a;
    stim[14] = 26'h0bc5c96;
    stim[15] = 26'h088a666;
    stim[16] = 26'h07a0e2b;
    stim[17] = 26'h107846f;
    stim[18] = 26'h08be5f7;
    stim[19] = 26'h03dd806;
    stim[20] = 26'h0d1d520;
    stim[21] = 26'h08169ea;
    stim[22] = 26'h0c744ff;
    stim[23] = 26'h18a529b;
    stim[24] = 26'h1db64cb;
    stim[25] = 26'h14789c7;
    stim[26] = 26'h150ea51;
    stim[27] = 26'h0395580;
    stim[28] = 26'h1f29f26;
    stim[29] = 26'h16eda39;
    stim[30] = 26'h0a56997;
    stim[31] = 26'h19b8fd9;
    stim[32] = 26'h0c37893;
    stim[33] = 26'h1229924;
    stim[34] = 26'h1fcc380;
    stim[35] = 26'h0fb6409;
    stim[36] = 26'h01edf39;
    stim[37] = 26'h12a6ecf;
    stim[38] = 26'h0821505;
    stim[39] = 26'h0f07340;
    stim[40] = 26'h1578bef;
    stim[41] = 26'h1834462;
    stim[42] = 26'h1fb6e1a;
    stim[43] = 26'h022536d;
    stim[44] = 26'h1c25312;
    stim[45] = 26'h161ebce;
    stim[46] = 26'h0ee2e89;
    stim[47] = 26'h1d1266a;
    stim[48] = 26'h1ffd88b;
    stim[49] = 26'h184adec;
    stim[50] = 26'h06e8b6e;
    stim[51] = 26'h145b8c3;
    stim[52] = 26'h0d8a2b2;
    stim[53] = 26'h118240e;
    stim[54] = 26'h1ebd3de;
    stim[55] = 26'h045ffae;
    stim[56] = 26'h151fbe2;
    stim[57] = 26'h04bffe5;
    stim[58] = 26'h295a4fe;
    stim[59] = 26'h0a25418;
    stim[60] = 26'h1ba5bd8;
    stim[61] = 26'h13452be;
    stim[62] = 26'h13c3e02;
    stim[63] = 26'h12dba70;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h004;
      expv[6] = 11'h004;
      expv[7] = 11'h004;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h004;
      expv[13] = 11'h000;
      expv[14] = 11'h004;
      expv[15] = 11'h000;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h004;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h004;
      expv[25] = 11'h004;
      expv[26] = 11'h004;
      expv[27] = 11'h004;
      expv[28] = 11'h000;
      expv[29] = 11'h004;
      expv[30] = 11'h004;
      expv[31] = 11'h000;
      expv[32] = 11'h004;
      expv[33] = 11'h000;
      expv[34] = 11'h004;
      expv[35] = 11'h004;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h004;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h004;
      expv[42] = 11'h004;
      expv[43] = 11'h004;
      expv[44] = 11'h000;
      expv[45] = 11'h004;
      expv[46] = 11'h004;
      expv[47] = 11'h000;
      expv[48] = 11'h004;
      expv[49] = 11'h004;
      expv[50] = 11'h004;
      expv[51] = 11'h000;
      expv[52] = 11'h004;
      expv[53] = 11'h000;
      expv[54] = 11'h004;
      expv[55] = 11'h004;
      expv[56] = 11'h000;
      expv[57] = 11'h004;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h004;
      expv[62] = 11'h004;
      expv[63] = 11'h004;
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

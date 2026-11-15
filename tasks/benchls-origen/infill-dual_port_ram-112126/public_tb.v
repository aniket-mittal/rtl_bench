// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_112126 dut (
    .clk(clk),
    .n_rst(in_vec[44:44]),
    .i_ram_rd_en(in_vec[43:43]),
    .i_ram_rd_addr(in_vec[42:40]),
    .i_ram_wr_en(in_vec[39:39]),
    .i_ram_wr_byte_en(in_vec[38:35]),
    .i_ram_wr_addr(in_vec[34:32]),
    .i_ram_wr_data(in_vec[31:0]),
    .o_ram_rd_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h1baf47cbdaac;
    stim[1] = 45'h100bd1d9ab1b;
    stim[2] = 45'h0e590755e784;
    stim[3] = 45'h0f5155024da8;
    stim[4] = 45'h0d1935c1da08;
    stim[5] = 45'h096f29b7653a;
    stim[6] = 45'h032671d8f03a;
    stim[7] = 45'h0efe72f5ebee;
    stim[8] = 45'h057cca319bc1;
    stim[9] = 45'h0dda18ececd1;
    stim[10] = 45'h0aeda2fbda0e;
    stim[11] = 45'h01230d486a33;
    stim[12] = 45'h0270ab285f75;
    stim[13] = 45'h04bc677c6234;
    stim[14] = 45'h0be038dd80b2;
    stim[15] = 45'h0bc535f6457d;
    stim[16] = 45'h068c925adc5e;
    stim[17] = 45'h0f67ff3f6fac;
    stim[18] = 45'h0fe7d249f560;
    stim[19] = 45'h015ef2b017ba;
    stim[20] = 45'h0530230b01fe;
    stim[21] = 45'h0a387788715a;
    stim[22] = 45'h03408aa15fc2;
    stim[23] = 45'h04abad12b477;
    stim[24] = 45'h003e4e67f86e;
    stim[25] = 45'h02044e1ade54;
    stim[26] = 45'h0483b1c554bb;
    stim[27] = 45'h03a80670f6df;
    stim[28] = 45'h0c8b6cec0372;
    stim[29] = 45'h0074cd1f576b;
    stim[30] = 45'h0a7766664fcc;
    stim[31] = 45'h0a656134f943;
    stim[32] = 45'h06961722cec5;
    stim[33] = 45'h0d11d8553b8e;
    stim[34] = 45'h0b761c32041b;
    stim[35] = 45'h01c956950ed6;
    stim[36] = 45'h0c9a39d42bfd;
    stim[37] = 45'h00fb0c76c93c;
    stim[38] = 45'h0aa26ae1549b;
    stim[39] = 45'h05ed62cab2ab;
    stim[40] = 45'h0883a2333cc1;
    stim[41] = 45'h0263d27f5efd;
    stim[42] = 45'h05020656ddf7;
    stim[43] = 45'h0ef1f9608e62;
    stim[44] = 45'h14ba0da1dd10;
    stim[45] = 45'h00004552a7b4;
    stim[46] = 45'h03c99683b241;
    stim[47] = 45'h0c4853bba6db;
    stim[48] = 45'h0495d1efae35;
    stim[49] = 45'h0d814b395e3e;
    stim[50] = 45'h0bcc0a17a8ab;
    stim[51] = 45'h08e307a7acd7;
    stim[52] = 45'h08fd564ddc7c;
    stim[53] = 45'h09f7240c676d;
    stim[54] = 45'h06cd12b41264;
    stim[55] = 45'h0131b07de3a3;
    stim[56] = 45'h064e4bd4c624;
    stim[57] = 45'h0c5fc05ff091;
    stim[58] = 45'h07d23efa0dcd;
    stim[59] = 45'h0f1dfd637e78;
    stim[60] = 45'h00d3e2e1dcf1;
    stim[61] = 45'h0faf2d0ce5c3;
    stim[62] = 45'h0cbb5bc7879b;
    stim[63] = 45'h02feeaa8d938;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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

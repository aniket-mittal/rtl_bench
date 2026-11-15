// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116528 dut (
    .clk(clk),
    .n_rst(in_vec[35:35]),
    .PSEL(in_vec[34:34]),
    .PENABLE(in_vec[33:33]),
    .PWRITE(in_vec[32:32]),
    .PWDATA(in_vec[31:0]),
    .MIDI_Data(out_vec[32:1]),
    .data_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hba07b74c3;
    stim[1] = 36'h8a666794c;
    stim[2] = 36'h2786dc083;
    stim[3] = 36'h08d19e2d7;
    stim[4] = 36'h725abef11;
    stim[5] = 36'h729c21aeb;
    stim[6] = 36'h3209c8378;
    stim[7] = 36'h046506c72;
    stim[8] = 36'h78a359e5a;
    stim[9] = 36'h6dadd0cb2;
    stim[10] = 36'h72b624173;
    stim[11] = 36'h27d0897d3;
    stim[12] = 36'h795914d19;
    stim[13] = 36'h6f813bfae;
    stim[14] = 36'h43f74c8b6;
    stim[15] = 36'h4b2e6322c;
    stim[16] = 36'h5897026f6;
    stim[17] = 36'h2e6f93676;
    stim[18] = 36'h5683708c0;
    stim[19] = 36'h1e7cfc382;
    stim[20] = 36'h5c4239cf4;
    stim[21] = 36'h2d53716a2;
    stim[22] = 36'h5b143048f;
    stim[23] = 36'h2d2442a85;
    stim[24] = 36'h46a14b7a0;
    stim[25] = 36'h3b3b9bec7;
    stim[26] = 36'h3fa02bd67;
    stim[27] = 36'h4f1508247;
    stim[28] = 36'h07f68e8f1;
    stim[29] = 36'h616eb87a4;
    stim[30] = 36'h52e7c6fae;
    stim[31] = 36'h188a82529;
    stim[32] = 36'h30103298c;
    stim[33] = 36'h43c6c2528;
    stim[34] = 36'h5ebaf8ddf;
    stim[35] = 36'h0eeeabc95;
    stim[36] = 36'h454a26972;
    stim[37] = 36'h77543f5b6;
    stim[38] = 36'h1f08731e7;
    stim[39] = 36'h544282099;
    stim[40] = 36'h7f1af0e55;
    stim[41] = 36'h6e3b627af;
    stim[42] = 36'h4a9bd3f56;
    stim[43] = 36'h4801f67ea;
    stim[44] = 36'h33d8b1a98;
    stim[45] = 36'h546ef6127;
    stim[46] = 36'h7fc9f7201;
    stim[47] = 36'h6f0619e2d;
    stim[48] = 36'h47959fce9;
    stim[49] = 36'h04c595ada;
    stim[50] = 36'h4c733f85e;
    stim[51] = 36'h76d5f2f26;
    stim[52] = 36'h6fd01e8c1;
    stim[53] = 36'h0850b8245;
    stim[54] = 36'h7632bb004;
    stim[55] = 36'h71dc452e4;
    stim[56] = 36'h275efb390;
    stim[57] = 36'h48585327c;
    stim[58] = 36'h7851b9268;
    stim[59] = 36'h4c5ae2dd9;
    stim[60] = 36'h008c452c2;
    stim[61] = 36'h760229441;
    stim[62] = 36'h385bfe6fb;
    stim[63] = 36'ha6c1c1e1d;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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

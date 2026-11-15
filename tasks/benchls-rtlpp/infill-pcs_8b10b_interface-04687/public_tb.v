// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04687 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .alt_dataout(in_vec[16:9]),
    .alt_sync(in_vec[8:8]),
    .alt_disperr(in_vec[7:7]),
    .alt_ctrldetect(in_vec[6:6]),
    .alt_errdetect(in_vec[5:5]),
    .alt_rmfifodatadeleted(in_vec[4:4]),
    .alt_rmfifodatainserted(in_vec[3:3]),
    .alt_runlengthviolation(in_vec[2:2]),
    .alt_patterndetect(in_vec[1:1]),
    .alt_runningdisp(in_vec[0:0]),
    .altpcs_dataout(out_vec[14:7]),
    .altpcs_sync(out_vec[6:6]),
    .altpcs_disperr(out_vec[5:5]),
    .altpcs_ctrldetect(out_vec[4:4]),
    .altpcs_errdetect(out_vec[3:3]),
    .altpcs_rmfifodatadeleted(out_vec[2:2]),
    .altpcs_rmfifodatainserted(out_vec[1:1]),
    .altpcs_carrierdetect(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h34854;
    stim[1] = 18'h3dfd3;
    stim[2] = 18'h02693;
    stim[3] = 18'h04d3c;
    stim[4] = 18'h0a098;
    stim[5] = 18'h11bc1;
    stim[6] = 18'h1dd20;
    stim[7] = 18'h0645f;
    stim[8] = 18'h04ae1;
    stim[9] = 18'h1931a;
    stim[10] = 18'h04c26;
    stim[11] = 18'h081b8;
    stim[12] = 18'h0d6e4;
    stim[13] = 18'h1a57b;
    stim[14] = 18'h009ec;
    stim[15] = 18'h09a7e;
    stim[16] = 18'h1876c;
    stim[17] = 18'h026d2;
    stim[18] = 18'h00ca2;
    stim[19] = 18'h0477c;
    stim[20] = 18'h13907;
    stim[21] = 18'h11948;
    stim[22] = 18'h1544b;
    stim[23] = 18'h165b2;
    stim[24] = 18'h1d632;
    stim[25] = 18'h00128;
    stim[26] = 18'h02dd1;
    stim[27] = 18'h071d6;
    stim[28] = 18'h08b5b;
    stim[29] = 18'h100f2;
    stim[30] = 18'h1e4a9;
    stim[31] = 18'h04420;
    stim[32] = 18'h05882;
    stim[33] = 18'h1dda6;
    stim[34] = 18'h12b43;
    stim[35] = 18'h1753a;
    stim[36] = 18'h1bc19;
    stim[37] = 18'h05b80;
    stim[38] = 18'h103d7;
    stim[39] = 18'h00760;
    stim[40] = 18'h0c952;
    stim[41] = 18'h0e5e5;
    stim[42] = 18'h0904d;
    stim[43] = 18'h131cf;
    stim[44] = 18'h0c403;
    stim[45] = 18'h0f898;
    stim[46] = 18'h1917d;
    stim[47] = 18'h1f847;
    stim[48] = 18'h04634;
    stim[49] = 18'h183ca;
    stim[50] = 18'h03796;
    stim[51] = 18'h06b12;
    stim[52] = 18'h0cb3c;
    stim[53] = 18'h07ab7;
    stim[54] = 18'h00111;
    stim[55] = 18'h15a50;
    stim[56] = 18'h1c837;
    stim[57] = 18'h006e4;
    stim[58] = 18'h065fd;
    stim[59] = 18'h0bab4;
    stim[60] = 18'h10814;
    stim[61] = 18'h1634b;
    stim[62] = 18'h12983;
    stim[63] = 18'h0f3c8;
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
      expv[0] = 15'h0029;
      expv[1] = 15'h0029;
      expv[2] = 15'h0029;
      expv[3] = 15'h0029;
      expv[4] = 15'h09e5;
      expv[5] = 15'h0029;
      expv[6] = 15'h2867;
      expv[7] = 15'h46f1;
      expv[8] = 15'h0029;
      expv[9] = 15'h0029;
      expv[10] = 15'h12f9;
      expv[11] = 15'h0029;
      expv[12] = 15'h1349;
      expv[13] = 15'h0029;
      expv[14] = 15'h35f9;
      expv[15] = 15'h695f;
      expv[16] = 15'h0029;
      expv[17] = 15'h26df;
      expv[18] = 15'h0029;
      expv[19] = 15'h0029;
      expv[20] = 15'h0369;
      expv[21] = 15'h11df;
      expv[22] = 15'h4e41;
      expv[23] = 15'h0029;
      expv[24] = 15'h5553;
      expv[25] = 15'h0029;
      expv[26] = 15'h75cd;
      expv[27] = 15'h004b;
      expv[28] = 15'h0b75;
      expv[29] = 15'h1c75;
      expv[30] = 15'h0029;
      expv[31] = 15'h0029;
      expv[32] = 15'h0029;
      expv[33] = 15'h0029;
      expv[34] = 15'h1661;
      expv[35] = 15'h7769;
      expv[36] = 15'h4ad1;
      expv[37] = 15'h0029;
      expv[38] = 15'h6f47;
      expv[39] = 15'h16e1;
      expv[40] = 15'h40f5;
      expv[41] = 15'h01d9;
      expv[42] = 15'h3255;
      expv[43] = 15'h0029;
      expv[44] = 15'h2453;
      expv[45] = 15'h0029;
      expv[46] = 15'h0029;
      expv[47] = 15'h3e67;
      expv[48] = 15'h0029;
      expv[49] = 15'h0029;
      expv[50] = 15'h11cd;
      expv[51] = 15'h60f3;
      expv[52] = 15'h0de5;
      expv[53] = 15'h1ac5;
      expv[54] = 15'h0029;
      expv[55] = 15'h1eed;
      expv[56] = 15'h0029;
      expv[57] = 15'h0029;
      expv[58] = 15'h0029;
      expv[59] = 15'h01f9;
      expv[60] = 15'h0029;
      expv[61] = 15'h0029;
      expv[62] = 15'h4245;
      expv[63] = 15'h58d3;
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

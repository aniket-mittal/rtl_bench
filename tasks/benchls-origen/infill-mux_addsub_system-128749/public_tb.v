// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128749 dut (
    .mux_in0(in_vec[46:39]),
    .mux_in1(in_vec[38:31]),
    .mux_in2(in_vec[30:23]),
    .mux_in3(in_vec[22:15]),
    .mux_sel(in_vec[14:13]),
    .mux_en(in_vec[12:12]),
    .addsub_a(in_vec[11:8]),
    .addsub_b(in_vec[7:4]),
    .addsub_mode(in_vec[3:3]),
    .func_sel(in_vec[2:1]),
    .control_sel(in_vec[0:0]),
    .system_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h541bc3fe7c65;
    stim[1] = 47'h3d290768ec15;
    stim[2] = 47'h4d14080bbf09;
    stim[3] = 47'h7c020865bb4b;
    stim[4] = 47'h1d2f10b29f5a;
    stim[5] = 47'h77dac053da81;
    stim[6] = 47'h34b6c02a5719;
    stim[7] = 47'h3e09e54470ee;
    stim[8] = 47'h5fb4aa3f714b;
    stim[9] = 47'h4d348a1699c2;
    stim[10] = 47'h3e9bac189d25;
    stim[11] = 47'h7687dd65f46a;
    stim[12] = 47'h7068345ef5b9;
    stim[13] = 47'h2e5cd8235740;
    stim[14] = 47'h11ba6bfeb0ef;
    stim[15] = 47'h1bff3a09a6b0;
    stim[16] = 47'h39c5efad60d8;
    stim[17] = 47'h4f97ee6377a9;
    stim[18] = 47'h664782642219;
    stim[19] = 47'h66906b39076e;
    stim[20] = 47'h0ea4d2b08a29;
    stim[21] = 47'h43dd7c849488;
    stim[22] = 47'h562957b30ad2;
    stim[23] = 47'h706dc4ea992b;
    stim[24] = 47'h31c471598fab;
    stim[25] = 47'h6dd50cdf006f;
    stim[26] = 47'h36fbfc772a3b;
    stim[27] = 47'h4dc712d447f1;
    stim[28] = 47'h31a60b3fc887;
    stim[29] = 47'h59769ea3bad7;
    stim[30] = 47'h310410f6f57f;
    stim[31] = 47'h075bd79cbd1d;
    stim[32] = 47'h00ff092ebfd0;
    stim[33] = 47'h41263257ef6c;
    stim[34] = 47'h33be0fdb17f6;
    stim[35] = 47'h100f0e1d3e2a;
    stim[36] = 47'h68c13a5ede4d;
    stim[37] = 47'h6ab4479ad926;
    stim[38] = 47'h0eba72c36aae;
    stim[39] = 47'h631d08528932;
    stim[40] = 47'h5252ce356849;
    stim[41] = 47'h3df65f9e1ae8;
    stim[42] = 47'h0a3d5254ddbb;
    stim[43] = 47'h569d08c63d3d;
    stim[44] = 47'h3ec201d38a58;
    stim[45] = 47'h7c9018533290;
    stim[46] = 47'h38b24abc98ad;
    stim[47] = 47'h585e4fd33ec5;
    stim[48] = 47'h4aadf6315837;
    stim[49] = 47'h4c685af8519b;
    stim[50] = 47'h436002aacf68;
    stim[51] = 47'h6ea952463bde;
    stim[52] = 47'h31209e0245b7;
    stim[53] = 47'h4a8d77171336;
    stim[54] = 47'h08073fb04275;
    stim[55] = 47'h47083ad3449e;
    stim[56] = 47'h424a6d7f6351;
    stim[57] = 47'h2e2811a87fd4;
    stim[58] = 47'h646987f6f017;
    stim[59] = 47'h2c1a523f5e41;
    stim[60] = 47'h76b7e20aa80d;
    stim[61] = 47'h230e3d52c2c4;
    stim[62] = 47'h706830b55388;
    stim[63] = 47'h03f93faf2b23;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h37;
      expv[3] = 8'hfd;
      expv[4] = 8'h3a;
      expv[5] = 8'h82;
      expv[6] = 8'h86;
      expv[7] = 8'h88;
      expv[8] = 8'h71;
      expv[9] = 8'h9a;
      expv[10] = 8'h00;
      expv[11] = 8'hcb;
      expv[12] = 8'hc7;
      expv[13] = 8'hb0;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'hd3;
      expv[18] = 8'h01;
      expv[19] = 8'h00;
      expv[20] = 8'h08;
      expv[21] = 8'h87;
      expv[22] = 8'h00;
      expv[23] = 8'hd9;
      expv[24] = 8'hfb;
      expv[25] = 8'h00;
      expv[26] = 8'hf9;
      expv[27] = 8'h06;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'hfe;
      expv[33] = 8'h00;
      expv[34] = 8'h67;
      expv[35] = 8'h1e;
      expv[36] = 8'h00;
      expv[37] = 8'h8f;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h04;
      expv[41] = 8'h7b;
      expv[42] = 8'ha2;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h20;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'had;
      expv[50] = 8'h00;
      expv[51] = 8'h52;
      expv[52] = 8'h00;
      expv[53] = 8'h95;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h08;
      expv[57] = 8'h50;
      expv[58] = 8'h00;
      expv[59] = 8'ha6;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h61;
      expv[63] = 8'hf3;
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

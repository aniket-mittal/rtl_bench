// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  S4 dut (
    .clk(clk),
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hfd91434f;
    stim[1] = 32'h4645786e;
    stim[2] = 32'hb1fe928e;
    stim[3] = 32'h3895e83a;
    stim[4] = 32'h232a8fb6;
    stim[5] = 32'hc52f9024;
    stim[6] = 32'h40497d9e;
    stim[7] = 32'he9dada26;
    stim[8] = 32'h80e4516c;
    stim[9] = 32'ha951c97d;
    stim[10] = 32'hea4aa854;
    stim[11] = 32'h4cf29d29;
    stim[12] = 32'ha5ff6b77;
    stim[13] = 32'hf30109fd;
    stim[14] = 32'h6cae339c;
    stim[15] = 32'h7ba068d1;
    stim[16] = 32'h92609d75;
    stim[17] = 32'hf4c733f7;
    stim[18] = 32'h9b2a54c9;
    stim[19] = 32'hd13a9cdc;
    stim[20] = 32'h5fe876bd;
    stim[21] = 32'ha6960b89;
    stim[22] = 32'hb058ab30;
    stim[23] = 32'ha744027a;
    stim[24] = 32'h05bd3499;
    stim[25] = 32'h5c6ea1b3;
    stim[26] = 32'h20a3039c;
    stim[27] = 32'h7188c9c1;
    stim[28] = 32'hfcbf7566;
    stim[29] = 32'hc269f34a;
    stim[30] = 32'hc9c1295f;
    stim[31] = 32'he00fd01c;
    stim[32] = 32'h5909b4af;
    stim[33] = 32'h90701a78;
    stim[34] = 32'h16a7e4d8;
    stim[35] = 32'hd4ea0f89;
    stim[36] = 32'h6d2fee7d;
    stim[37] = 32'h325623cc;
    stim[38] = 32'haa4a761f;
    stim[39] = 32'h9d63f732;
    stim[40] = 32'hfb5a9c5d;
    stim[41] = 32'hb11e4642;
    stim[42] = 32'hf2206e5a;
    stim[43] = 32'h6233024d;
    stim[44] = 32'h77c1f496;
    stim[45] = 32'h6869b4f9;
    stim[46] = 32'h3ef0a0a6;
    stim[47] = 32'h285a3611;
    stim[48] = 32'h56f1dcf3;
    stim[49] = 32'h8b7c3982;
    stim[50] = 32'h17e66b8e;
    stim[51] = 32'hc3f64107;
    stim[52] = 32'h59821b38;
    stim[53] = 32'h13b32cae;
    stim[54] = 32'hcf16f312;
    stim[55] = 32'haca59ab5;
    stim[56] = 32'h1bb9d51c;
    stim[57] = 32'h3eee5091;
    stim[58] = 32'h51b3e1d2;
    stim[59] = 32'h01f35394;
    stim[60] = 32'h4edb8154;
    stim[61] = 32'h3eb697b9;
    stim[62] = 32'h47af0c35;
    stim[63] = 32'h5478817c;
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
      expv[1] = 32'h54811a84;
      expv[2] = 32'h5a6ebc9f;
      expv[3] = 32'hc8bb4f19;
      expv[4] = 32'h072a9b80;
      expv[5] = 32'h26e5734e;
      expv[6] = 32'ha6156036;
      expv[7] = 32'h093bff0b;
      expv[8] = 32'h1e5757f7;
      expv[9] = 32'hcd69d150;
      expv[10] = 32'hd3d1ddff;
      expv[11] = 32'h87d6c220;
      expv[12] = 32'h29895ea5;
      expv[13] = 32'h06167ff5;
      expv[14] = 32'h0d7c0154;
      expv[15] = 32'h50e4c3de;
      expv[16] = 32'h21e0453e;
      expv[17] = 32'h4fd05e9d;
      expv[18] = 32'hbfc6c368;
      expv[19] = 32'h14e520dd;
      expv[20] = 32'h3e80de86;
      expv[21] = 32'hcf9b387a;
      expv[22] = 32'h24902ba7;
      expv[23] = 32'he76a6204;
      expv[24] = 32'h5c1b77da;
      expv[25] = 32'h6b7a18ee;
      expv[26] = 32'h4a9f326d;
      expv[27] = 32'hb70a7bde;
      expv[28] = 32'ha3c4dd78;
      expv[29] = 32'hb0089d33;
      expv[30] = 32'h25f90dd6;
      expv[31] = 32'hdd78a5cf;
      expv[32] = 32'he176709c;
      expv[33] = 32'hcb018d79;
      expv[34] = 32'h6051a2bc;
      expv[35] = 32'h475c6961;
      expv[36] = 32'h488776a7;
      expv[37] = 32'h3c1528ff;
      expv[38] = 32'h23b1264b;
      expv[39] = 32'hacd638c0;
      expv[40] = 32'h5efb6823;
      expv[41] = 32'h0fbede4c;
      expv[42] = 32'hc8725a2c;
      expv[43] = 32'h89b79fbe;
      expv[44] = 32'haac377e3;
      expv[45] = 32'hf578bf90;
      expv[46] = 32'h45f98d99;
      expv[47] = 32'hb28ce024;
      expv[48] = 32'h34be0582;
      expv[49] = 32'hb1a1860d;
      expv[50] = 32'h3d101213;
      expv[51] = 32'hf08e7f19;
      expv[52] = 32'h2e4283c5;
      expv[53] = 32'hcb13af07;
      expv[54] = 32'h7d6d71e4;
      expv[55] = 32'h8a470dc9;
      expv[56] = 32'h9106b8d5;
      expv[57] = 32'haf56039c;
      expv[58] = 32'hb2285381;
      expv[59] = 32'hd16df8b5;
      expv[60] = 32'h7c0ded22;
      expv[61] = 32'h2fb90c20;
      expv[62] = 32'hb24e8856;
      expv[63] = 32'ha079fe96;
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

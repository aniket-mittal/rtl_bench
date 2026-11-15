// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 196;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_092951 dut (
    .clk(clk),
    .reset(in_vec[75:75]),
    .cdp2um_data(in_vec[74:11]),
    .cdp2um_data_valid(in_vec[10:10]),
    .transmit_usedw(in_vec[9:0]),
    .metadata(out_vec[195:68]),
    .metadata_valid(out_vec[67:67]),
    .pkt(out_vec[66:3]),
    .pkt_valid(out_vec[2:2]),
    .um2cdp_path(out_vec[1:1]),
    .um2cdp_tx_enable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'h8e748162dada2b6f346;
    stim[1] = 76'hed0b01eb41a57fd9590;
    stim[2] = 76'h5ca5103bc9c74caad2c;
    stim[3] = 76'h774c4f92aa1b8c6091d;
    stim[4] = 76'h2208c7a9329e4927ac5;
    stim[5] = 76'h236dc95df907d950616;
    stim[6] = 76'h035056aba1b991c2b40;
    stim[7] = 76'h027dfb6bdefee1bb21e;
    stim[8] = 76'h60fc6d93d2e0150655b;
    stim[9] = 76'h4452fb9295ab8ad5867;
    stim[10] = 76'h77da6ea0819d0ac5008;
    stim[11] = 76'h4f47e7e88ba7e2a05a6;
    stim[12] = 76'h0370bced601f3ca1f6d;
    stim[13] = 76'h3931bb6a2d28fd77044;
    stim[14] = 76'h7fd49b4163bb1aecb92;
    stim[15] = 76'h4da79936f5e108a0e9b;
    stim[16] = 76'h5a9f9af2414063fc241;
    stim[17] = 76'h473a5c32b83ce5eeed6;
    stim[18] = 76'h4017983da5538adfc0d;
    stim[19] = 76'h9b78d81cf533cb3d731;
    stim[20] = 76'h415b51880bc90c38a66;
    stim[21] = 76'h30d45aab0e2755fe9b5;
    stim[22] = 76'h76544ad02a54df07feb;
    stim[23] = 76'h5b261649a1e0a28e4d3;
    stim[24] = 76'h3f3f1618f5186f11cdf;
    stim[25] = 76'h55c0f6b766e2fc07bcf;
    stim[26] = 76'h19639aea04b747898d8;
    stim[27] = 76'h5dd3b8bd4b225389937;
    stim[28] = 76'h3512186bf7d76fa7e9e;
    stim[29] = 76'h41350de91a94e65fc3e;
    stim[30] = 76'h7bbaa4b1f9d77627c34;
    stim[31] = 76'h33a891daf4925b63df0;
    stim[32] = 76'h5e445e9f74ed142e7b0;
    stim[33] = 76'h36892f62f12f153c8e3;
    stim[34] = 76'h7f939bfd92076fc4f4f;
    stim[35] = 76'h6571b1ab0a1acdc97df;
    stim[36] = 76'h08c1c9374c0efc07f90;
    stim[37] = 76'h24fca39ab67dfa79349;
    stim[38] = 76'h5fc2c78d3dd2d9938f5;
    stim[39] = 76'h3130fcd00720330a874;
    stim[40] = 76'h5c41c3dbfc1b6ab8b1d;
    stim[41] = 76'h761a5d5fbf1d5215ce2;
    stim[42] = 76'h314ac98402e52ebbe01;
    stim[43] = 76'h4ed666c599d540c8c11;
    stim[44] = 76'h3e36c044f808e75ba38;
    stim[45] = 76'h5d9b38ae39eb643ccb4;
    stim[46] = 76'h38db14b54fcd62757e5;
    stim[47] = 76'h0053b4a7d0ba9184aa7;
    stim[48] = 76'h1e3daa505b97624070f;
    stim[49] = 76'h1069a120e3e9853c397;
    stim[50] = 76'h31406aed81d404b9426;
    stim[51] = 76'h39de443dcc99a7d0cdf;
    stim[52] = 76'h66bbac7696bec19d256;
    stim[53] = 76'h286b7bf9492d8a1cf5b;
    stim[54] = 76'h5219834524d77b90bb0;
    stim[55] = 76'h7a8b31e445084cb3bc7;
    stim[56] = 76'h1aa62711d880dc10c8c;
    stim[57] = 76'h396ab30b27488335c51;
    stim[58] = 76'h59cdba7d60cea6b6691;
    stim[59] = 76'h3491f7d82629cb0835a;
    stim[60] = 76'h43ca5e00833d53c29e8;
    stim[61] = 76'h7ac4173cd76dd6401d7;
    stim[62] = 76'h3300cf81037b64c944d;
    stim[63] = 76'h15a7964645664e458f4;
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
      expv[0] = 196'h0000000000000000000000000000000000000000000000000;
      expv[1] = 196'h0000000000000000000000000000000000000000000000000;
      expv[2] = 196'h0000000000000000000000000000000000000000000000000;
      expv[3] = 196'h00000000000000000000ca5103bc9c74dca5103bc9c74caae;
      expv[4] = 196'h00000000000000000000ca5103bc9c745ca5103bc9c74caaa;
      expv[5] = 196'h00000000000000000000ca5103bc9c745ca5103bc9c74caa9;
      expv[6] = 196'h00000000000000000000ca5103bc9c74236dc95df907d9504;
      expv[7] = 196'h00000000000000000000ca5103bc9c74236dc95df907d9500;
      expv[8] = 196'h00000000000000000000ca5103bc9c74236dc95df907d9500;
      expv[9] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015066;
      expv[10] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015062;
      expv[11] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015063;
      expv[12] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015062;
      expv[13] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015060;
      expv[14] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015062;
      expv[15] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015060;
      expv[16] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015060;
      expv[17] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015060;
      expv[18] = 196'h00000000000000000000ca5103bc9c7460fc6d93d2e015061;
      expv[19] = 196'h0000000000000000000000000000000000000000000000000;
      expv[20] = 196'h0000000000000000000000000000000000000000000000000;
      expv[21] = 196'h0000000000000000000000000000000000000000000000000;
      expv[22] = 196'h0000000000000000000000000000000000000000000000002;
      expv[23] = 196'h0000000000000000000000000000000000000000000000000;
      expv[24] = 196'h00000000000000000000b261649a1e0adb261649a1e0a28e6;
      expv[25] = 196'h00000000000000000000b261649a1e0a3f3f1618f5186f11f;
      expv[26] = 196'h00000000000000000000b261649a1e0a3f3f1618f5186f118;
      expv[27] = 196'h00000000000000000000b261649a1e0a3f3f1618f5186f11a;
      expv[28] = 196'h00000000000000000000b261649a1e0a3f3f1618f5186f11a;
      expv[29] = 196'h00000000000000000000b261649a1e0a3512186bf7d76fa7c;
      expv[30] = 196'h00000000000000000000b261649a1e0a41350de91a94e65fe;
      expv[31] = 196'h00000000000000000000b261649a1e0a7bbaa4b1f9d77627f;
      expv[32] = 196'h00000000000000000000b261649a1e0a33a891daf4925b63e;
      expv[33] = 196'h00000000000000000000b261649a1e0a5e445e9f74ed142e4;
      expv[34] = 196'h00000000000000000000b261649a1e0a5e445e9f74ed142e2;
      expv[35] = 196'h00000000000000000000b261649a1e0a7f939bfd92076fc4c;
      expv[36] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc94;
      expv[37] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc90;
      expv[38] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc91;
      expv[39] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc92;
      expv[40] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc92;
      expv[41] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc90;
      expv[42] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc92;
      expv[43] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc90;
      expv[44] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc93;
      expv[45] = 196'h00000000000000000000b261649a1e0a6571b1ab0a1acdc90;
      expv[46] = 196'h00000000000000000000d9b38ae39eb6dd9b38ae39eb643ce;
      expv[47] = 196'h00000000000000000000d9b38ae39eb638db14b54fcd62754;
      expv[48] = 196'h00000000000000000000d9b38ae39eb638db14b54fcd62750;
      expv[49] = 196'h00000000000000000000d9b38ae39eb61e3daa505b9762405;
      expv[50] = 196'h00000000000000000000d9b38ae39eb61e3daa505b9762400;
      expv[51] = 196'h00000000000000000000d9b38ae39eb631406aed81d404b96;
      expv[52] = 196'h00000000000000000000d9b38ae39eb639de443dcc99a7d0e;
      expv[53] = 196'h00000000000000000000d9b38ae39eb639de443dcc99a7d08;
      expv[54] = 196'h00000000000000000000d9b38ae39eb6286b7bf9492d8a1cd;
      expv[55] = 196'h00000000000000000000d9b38ae39eb6286b7bf9492d8a1c8;
      expv[56] = 196'h00000000000000000000d9b38ae39eb6286b7bf9492d8a1c8;
      expv[57] = 196'h00000000000000000000d9b38ae39eb61aa62711d880dc10e;
      expv[58] = 196'h00000000000000000000d9b38ae39eb6396ab30b27488335e;
      expv[59] = 196'h00000000000000000000d9b38ae39eb659cdba7d60cea6b65;
      expv[60] = 196'h00000000000000000000d9b38ae39eb659cdba7d60cea6b60;
      expv[61] = 196'h00000000000000000000d9b38ae39eb659cdba7d60cea6b62;
      expv[62] = 196'h00000000000000000000d9b38ae39eb659cdba7d60cea6b62;
      expv[63] = 196'h00000000000000000000d9b38ae39eb63300cf81037b64c96;
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

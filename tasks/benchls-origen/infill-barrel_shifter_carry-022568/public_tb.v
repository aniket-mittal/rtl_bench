// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022568 dut (
    .a(in_vec[38:34]),
    .b(in_vec[33:2]),
    .aluc(in_vec[1:0]),
    .r(out_vec[32:1]),
    .carry(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h5e565a6410;
    stim[1] = 39'h552afa621e;
    stim[2] = 39'h5b3bc1a358;
    stim[3] = 39'h1fc2e19774;
    stim[4] = 39'h6124f3e09b;
    stim[5] = 39'h0c47f24b90;
    stim[6] = 39'h61eacfdc80;
    stim[7] = 39'h0446dce958;
    stim[8] = 39'h3803a0f84e;
    stim[9] = 39'h04a833ebce;
    stim[10] = 39'h4390eff21b;
    stim[11] = 39'h05cbbbd55c;
    stim[12] = 39'h784ae690cb;
    stim[13] = 39'h5bd7964ae8;
    stim[14] = 39'h5497c4669f;
    stim[15] = 39'h7f66668bd8;
    stim[16] = 39'h2ffb145e13;
    stim[17] = 39'h24dbe37fca;
    stim[18] = 39'h727ea7781b;
    stim[19] = 39'h2823446321;
    stim[20] = 39'h3a45857d85;
    stim[21] = 39'h7420b35923;
    stim[22] = 39'h380964edb3;
    stim[23] = 39'h2d6d5793c0;
    stim[24] = 39'h55c406d566;
    stim[25] = 39'h07b404b273;
    stim[26] = 39'h1e9a978a4f;
    stim[27] = 39'h610ee996fd;
    stim[28] = 39'h257abe9a7a;
    stim[29] = 39'h02bc007510;
    stim[30] = 39'h781cd77932;
    stim[31] = 39'h352f467590;
    stim[32] = 39'h35b66ff0b4;
    stim[33] = 39'h5d79005ee4;
    stim[34] = 39'h2f94080052;
    stim[35] = 39'h1e19d59eb7;
    stim[36] = 39'h20e2aeffb1;
    stim[37] = 39'h34312348cb;
    stim[38] = 39'h42bbc3e6c3;
    stim[39] = 39'h1b7e15d72d;
    stim[40] = 39'h04094d77a3;
    stim[41] = 39'h550ca61d37;
    stim[42] = 39'h46b50ae0e0;
    stim[43] = 39'h5203855c7f;
    stim[44] = 39'h35f5970c66;
    stim[45] = 39'h586e46eb1f;
    stim[46] = 39'h3560e3acab;
    stim[47] = 39'h3cd70fc062;
    stim[48] = 39'h265a584f69;
    stim[49] = 39'h551ad139d4;
    stim[50] = 39'h5e39f70b7b;
    stim[51] = 39'h49772bfbba;
    stim[52] = 39'h615726c41f;
    stim[53] = 39'h1a4e188067;
    stim[54] = 39'h716ab4e1ec;
    stim[55] = 39'h5206750f3e;
    stim[56] = 39'h16d7a05c1f;
    stim[57] = 39'h7d9122206e;
    stim[58] = 39'h2ae7835005;
    stim[59] = 39'h532a6b105c;
    stim[60] = 39'h451a7ed7ca;
    stim[61] = 39'h3caa905341;
    stim[62] = 39'h4366f7f80c;
    stim[63] = 39'h59c0489945;
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
      expv[0] = 33'h1fffffe56;
      expv[1] = 33'h021c00001;
      expv[2] = 33'h1fffffe77;
      expv[3] = 33'h1ffc2e197;
      expv[4] = 33'h04c000000;
      expv[5] = 33'h0047f24b9;
      expv[6] = 33'h0000000f5;
      expv[7] = 33'h011b73a56;
      expv[8] = 33'h01f098000;
      expv[9] = 33'h0a833ebcc;
      expv[10] = 33'h1f90c0001;
      expv[11] = 33'h072eef557;
      expv[12] = 33'h100000000;
      expv[13] = 33'h1ffffffaf;
      expv[14] = 33'h069c00001;
      expv[15] = 33'h1ffffffff;
      expv[16] = 33'h051784000;
      expv[17] = 33'h1e37fc801;
      expv[18] = 33'h0c0000000;
      expv[19] = 33'h00004688c;
      expv[20] = 33'h000048b0a;
      expv[21] = 33'h000000001;
      expv[22] = 33'h09db60000;
      expv[23] = 33'h00016d579;
      expv[24] = 33'h156400000;
      expv[25] = 33'h1b404b271;
      expv[26] = 33'h0a5e29301;
      expv[27] = 33'h000000087;
      expv[28] = 33'h0be9a7801;
      expv[29] = 33'h15e003a8x;
      expv[30] = 33'h000000001;
      expv[31] = 33'h00004bd19;
      expv[32] = 33'h00006d9bf;
      expv[33] = 33'h000000179;
      expv[34] = 33'h020014000;
      expv[35] = 33'h07567ad01;
      expv[36] = 33'h00071577f;
      expv[37] = 33'h0348c8001;
      expv[38] = 33'h1f3600000;
      expv[39] = 33'h006fc2bae;
      expv[40] = 33'h0094d77a0;
      expv[41] = 33'h1d3400000;
      expv[42] = 33'h1ffffad42;
      expv[43] = 33'h0e3e00001;
      expv[44] = 33'h170c64000;
      expv[45] = 33'h163800000;
      expv[46] = 33'h03aca8001;
      expv[47] = 33'h1f0180001;
      expv[48] = 33'h000969613;
      expv[49] = 33'h00000046b;
      expv[50] = 33'h0de000001;
      expv[51] = 33'h1f7700001;
      expv[52] = 33'h00e000001;
      expv[53] = 33'h1c3100c80;
      expv[54] = 33'h00000000b;
      expv[55] = 33'h079e00000;
      expv[56] = 33'h17a05c1c0;
      expv[57] = 33'h100000001;
      expv[58] = 33'h0005cf06a;
      expv[59] = 33'h1fffff953;
      expv[60] = 33'h0d7c80001;
      expv[61] = 33'h00000aa90;
      expv[62] = 33'h1ffffb37b;
      expv[63] = 33'h000000380;
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

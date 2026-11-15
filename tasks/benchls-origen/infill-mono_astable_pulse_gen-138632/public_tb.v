// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 74;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138632 dut (
    .clk(clk),
    .rst_n(in_vec[73:73]),
    .trig(in_vec[72:72]),
    .t(in_vec[71:40]),
    .f(in_vec[39:8]),
    .dc(in_vec[7:0]),
    .mono_pulse(out_vec[1:1]),
    .astable_pulse(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 74'h0c8176c828be8380411;
    stim[1] = 74'h1a1e5b8ddbee03a76fa;
    stim[2] = 74'h30b91797753947726b6;
    stim[3] = 74'h35c90032365d4e03374;
    stim[4] = 74'h3cf7208f5275a9fe43a;
    stim[5] = 74'h3bcd389fdcedd58e993;
    stim[6] = 74'h05ca952a6f7d23094b2;
    stim[7] = 74'h24f71641c1e176aa8c3;
    stim[8] = 74'h2ace600d0b354a430c1;
    stim[9] = 74'h377feb71b836ee36325;
    stim[10] = 74'h3186b50703c4fd4b2ae;
    stim[11] = 74'h336718ccf1bd7895e1d;
    stim[12] = 74'h39b0582c10c6d313096;
    stim[13] = 74'h3f8713ea4f34b3727e8;
    stim[14] = 74'h2f030e38c4db7794bc3;
    stim[15] = 74'h2c1a394c14ce32b1315;
    stim[16] = 74'h30886819401a88964c7;
    stim[17] = 74'h353ec248a99109e603c;
    stim[18] = 74'h3b5cfda24d81bf720b1;
    stim[19] = 74'h262883d1ecba149be86;
    stim[20] = 74'h25c218ca959577f0872;
    stim[21] = 74'h217d8bc1f655eea2b88;
    stim[22] = 74'h3d176fe8f8653c1d19b;
    stim[23] = 74'h3236b7b662bdb9a68eb;
    stim[24] = 74'h3545733ed6b3352ad7a;
    stim[25] = 74'h23862ee2c6635b89b1a;
    stim[26] = 74'h22bab25a5089d5db108;
    stim[27] = 74'h2a0b106dbcfac672854;
    stim[28] = 74'h202e6df114a655e00e2;
    stim[29] = 74'h3823f9d140617e9bfd2;
    stim[30] = 74'h36a02105ee78ccf1ea7;
    stim[31] = 74'h32de453e5fd68f5f67b;
    stim[32] = 74'h319d390f81c0f9b70e5;
    stim[33] = 74'h264ddf314b9a914208f;
    stim[34] = 74'h3492f8bf966c7b1b560;
    stim[35] = 74'h2eb866a10e5992a4d1c;
    stim[36] = 74'h3a33bf90f933dab46bf;
    stim[37] = 74'h351df173fec2f08faeb;
    stim[38] = 74'h288638ddb9d9d6f3353;
    stim[39] = 74'h21dc7623fec66117d37;
    stim[40] = 74'h2ba9c9a4da033e5460f;
    stim[41] = 74'h2150da5066decd2571b;
    stim[42] = 74'h347630842945e880587;
    stim[43] = 74'h350582481cbfb45cf0b;
    stim[44] = 74'h38104ab1229dd381f32;
    stim[45] = 74'h334db73af491b1a01ff;
    stim[46] = 74'h28ca498c4e3ff9f3888;
    stim[47] = 74'h34e6ffbf2d70fa1744c;
    stim[48] = 74'h3b42095e4f7bc04479e;
    stim[49] = 74'h3d399d7a79689bd2563;
    stim[50] = 74'h2e82d0fa35f6a07f217;
    stim[51] = 74'h3fc6291cd9d57b3565b;
    stim[52] = 74'h3b4632bf23127a24d2b;
    stim[53] = 74'h3b96f3611d573b3189a;
    stim[54] = 74'h3fb14dae0966d595ea4;
    stim[55] = 74'h244317fa3e06a98408e;
    stim[56] = 74'h27d3f536d6366407080;
    stim[57] = 74'h3acd82743b61a5f90a7;
    stim[58] = 74'h398cba1cf856ed74844;
    stim[59] = 74'h2a3cf837a9c91cbef96;
    stim[60] = 74'h29e230b52aa8a97995f;
    stim[61] = 74'h2b0717c3417668a079a;
    stim[62] = 74'h2b56c09a9740013aa82;
    stim[63] = 74'h26bd6f39e78083c5bcf;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h2;
      expv[4] = 2'h2;
      expv[5] = 2'h2;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h2;
      expv[11] = 2'h2;
      expv[12] = 2'h2;
      expv[13] = 2'h3;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h3;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h2;
      expv[24] = 2'h2;
      expv[25] = 2'h2;
      expv[26] = 2'h2;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h2;
      expv[30] = 2'h3;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h2;
      expv[36] = 2'h2;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h2;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h2;
      expv[60] = 2'h2;
      expv[61] = 2'h2;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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

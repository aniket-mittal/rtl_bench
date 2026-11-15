// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06176 dut (
    .clock(clk),
    .resetn(in_vec[67:67]),
    .data(in_vec[66:3]),
    .valid_in(in_vec[2:2]),
    .stall_in(in_vec[1:1]),
    .enable(in_vec[0:0]),
    .mantissa(out_vec[70:15]),
    .exponent(out_vec[14:3]),
    .sign(out_vec[2:2]),
    .valid_out(out_vec[1:1]),
    .stall_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h21491aad968899ca9;
    stim[1] = 68'h19b473457c330620c;
    stim[2] = 68'hbdeea367101aadbfa;
    stim[3] = 68'h9d6c2163e09dc30a6;
    stim[4] = 68'ha18b26c6b1c121e20;
    stim[5] = 68'hb76cc92812568244a;
    stim[6] = 68'h930e0afbd9a610f5e;
    stim[7] = 68'hcbe838a846f3db896;
    stim[8] = 68'hd81f9fc90dfc6a8ec;
    stim[9] = 68'ha11fbdde99a452e9d;
    stim[10] = 68'hba1c596ca84c75269;
    stim[11] = 68'hd5feccfb9fb6c78dc;
    stim[12] = 68'hd1c6516c0dfb30862;
    stim[13] = 68'he20a42e311526c20c;
    stim[14] = 68'hd0782fcb06a134603;
    stim[15] = 68'hc27b9ea6fced5cb1e;
    stim[16] = 68'ha4c1be6144048b5fe;
    stim[17] = 68'hc1681e1c83b57f9a6;
    stim[18] = 68'ha5e0933a17f176c5c;
    stim[19] = 68'h8579c185371f0aaf2;
    stim[20] = 68'h9b773145debd52a2e;
    stim[21] = 68'hc174b337dc650a173;
    stim[22] = 68'hf1512593e60cbc058;
    stim[23] = 68'ha0468bc152ceb1e6a;
    stim[24] = 68'ha1875494bb3c175c8;
    stim[25] = 68'h6bf6ec8a41d0b2c8c;
    stim[26] = 68'hc3a3ef72be1673263;
    stim[27] = 68'heef4145795ff706f3;
    stim[28] = 68'hfe63dd86d0e5cc1ae;
    stim[29] = 68'hf7f33142157103879;
    stim[30] = 68'hba4eab69e8022eb05;
    stim[31] = 68'hc5a86ffc64728ddb4;
    stim[32] = 68'h828acb61b8c646ae4;
    stim[33] = 68'he0e772adaaf268dad;
    stim[34] = 68'ha48daa494b5086af3;
    stim[35] = 68'heb5e5340e036a1ff5;
    stim[36] = 68'hceb36be41fb610217;
    stim[37] = 68'hd9a58e3996ce8852b;
    stim[38] = 68'hff2a248e70bf812e1;
    stim[39] = 68'hff60cfb8634c35460;
    stim[40] = 68'h8cb202c6631d549d8;
    stim[41] = 68'hd392dc7e986d4cbf5;
    stim[42] = 68'hba12f2d4f8d1378a4;
    stim[43] = 68'ha8c4b685098d3a794;
    stim[44] = 68'he6e90a042368071d0;
    stim[45] = 68'h8b74cd9ff779d3021;
    stim[46] = 68'ha7970831eb96af92d;
    stim[47] = 68'hb65178e56a127ee5d;
    stim[48] = 68'hf044998f8a18500d5;
    stim[49] = 68'h997719198426c2c61;
    stim[50] = 68'h74e0cc73ede9d3545;
    stim[51] = 68'h8649a4c741efa8842;
    stim[52] = 68'h9d3cb1fb144012c42;
    stim[53] = 68'hd94473ab3c90d664a;
    stim[54] = 68'hc15996028f1393d96;
    stim[55] = 68'hd9c11b3115a59a081;
    stim[56] = 68'he30db666124370463;
    stim[57] = 68'hdf9f936f0453631c9;
    stim[58] = 68'h99f39c8510f202d71;
    stim[59] = 68'h86963b3182ec3961b;
    stim[60] = 68'hfca164b408a703385;
    stim[61] = 68'hbd1c79094a869f89d;
    stim[62] = 68'ha2ac265b0ed9d7948;
    stim[63] = 68'h808ea2fc80cf0567c;
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
      expv[0] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[2] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[3] = 71'h751b3880d56dfc3de8;
      expv[4] = 71'h610b1f04ee18501d6a;
      expv[5] = 71'h5936358e090f102188;
      expv[6] = 71'h66494092b412243768;
      expv[7] = 71'h7057decd3087ac130b;
      expv[8] = 71'h7057decd3087ac130a;
      expv[9] = 71'h7cfe486fe35474181e;
      expv[10] = 71'h7deef4cd22974c211a;
      expv[11] = 71'h62cb654263a9343a18;
      expv[12] = 71'h7667dcfdb63c6c15ff;
      expv[13] = 71'h7667dcfdb63c6c15fe;
      expv[14] = 71'h5217188a936104220f;
      expv[15] = 71'h5217188a936104220f;
      expv[16] = 71'h5217188a936104220f;
      expv[17] = 71'h5217188a936104220f;
      expv[18] = 71'h5217188a936104220e;
      expv[19] = 71'h4499d0bf8bb62c25e3;
      expv[20] = 71'h4499d0bf8bb62c25e3;
      expv[21] = 71'h4499d0bf8bb62c25e3;
      expv[22] = 71'h4499d0bf8bb62c25e2;
      expv[23] = 71'h492c9f3065e02c3154;
      expv[24] = 71'h745e0a96758f342040;
      expv[25] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[26] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[27] = 71'h5f7b95f0b3993003a4;
      expv[28] = 71'h60a2bcaffb83782ef4;
      expv[29] = 71'h5eec36872e60d43e66;
      expv[30] = 71'h598a10ab881c3c37f4;
      expv[31] = 71'h755b4f401175803a4a;
      expv[32] = 71'h437fe323946ed805ae;
      expv[33] = 71'h565b0dc6323570028a;
      expv[34] = 71'h7b956d579346d420e7;
      expv[35] = 71'h7b956d579346d420e6;
      expv[36] = 71'h729a0701b50ff82b5f;
      expv[37] = 71'h729a0701b50ff82b5f;
      expv[38] = 71'h729a0701b50ff82b5e;
      expv[39] = 71'h51247385fc09703f2c;
      expv[40] = 71'h467dc31a61aa303f64;
      expv[41] = 71'h50163318eaa4ec0cb0;
      expv[42] = 71'h56e3f4c36a65f81396;
      expv[43] = 71'h5796a7c689bc503a12;
      expv[44] = 71'h65b4284c69d3c828c2;
      expv[45] = 71'h4850211b4038e826ec;
      expv[46] = 71'h666cffbbce98100b70;
      expv[47] = 71'h78418f5cb57c942792;
      expv[48] = 71'h4bc72b5093f72c3652;
      expv[49] = 71'h64cc7c50c280683046;
      expv[50] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[51] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[52] = 71'h4d263a0f7d44200648;
      expv[53] = 71'h658fd8a20096201d38;
      expv[54] = 71'h639d59e486b3241944;
      expv[55] = 71'h4cb014789c9ec8015e;
      expv[56] = 71'h48d988ad2cd04019c4;
      expv[57] = 71'h6db330921b8230230c;
      expv[58] = 71'h7c9b78229b18e41f9c;
      expv[59] = 71'h5ce428879016b819f0;
      expv[60] = 71'h71d98c1761cb0c0690;
      expv[61] = 71'h4b25a0453819c03ca6;
      expv[62] = 71'h63c84a5434fc4c3d1a;
      expv[63] = 71'h6132d876cebca422a8;
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

// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061090 dut (
    .clk(clk),
    .d_in(in_vec[45:14]),
    .offset_in(in_vec[13:8]),
    .msbyte_in(in_vec[7:0]),
    .offset_out(out_vec[45:40]),
    .msbyte_out(out_vec[39:32]),
    .p_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h2b20198fafcd;
    stim[1] = 46'h1c09364634bd;
    stim[2] = 46'h36e715d211cc;
    stim[3] = 46'h1fd7e4febb42;
    stim[4] = 46'h1f2df1174496;
    stim[5] = 46'h114a16399077;
    stim[6] = 46'h30b007452d40;
    stim[7] = 46'h1bc32f7255d0;
    stim[8] = 46'h220230c42152;
    stim[9] = 46'h38e9d422e12a;
    stim[10] = 46'h3e844ce62b7d;
    stim[11] = 46'h2eaa6db86205;
    stim[12] = 46'h272feef47c81;
    stim[13] = 46'h08526a152459;
    stim[14] = 46'h26901d63b2dc;
    stim[15] = 46'h0f0b69ed4efe;
    stim[16] = 46'h25dfb55b57ca;
    stim[17] = 46'h2d1c3f8aa9ec;
    stim[18] = 46'h2b9613820872;
    stim[19] = 46'h31138f3060f0;
    stim[20] = 46'h1277a9b702fa;
    stim[21] = 46'h2dc694342052;
    stim[22] = 46'h1d44aec076b6;
    stim[23] = 46'h149e754d7337;
    stim[24] = 46'h1d8a5b22dd64;
    stim[25] = 46'h3e52ea6bbf06;
    stim[26] = 46'h1981c7e011e4;
    stim[27] = 46'h0ef92daa9e75;
    stim[28] = 46'h11e53c6f57c6;
    stim[29] = 46'h2925de44de6c;
    stim[30] = 46'h316ed8f2c8b7;
    stim[31] = 46'h2a29f18ecb9b;
    stim[32] = 46'h14506c2cae76;
    stim[33] = 46'h35cc4d3ab2a9;
    stim[34] = 46'h0cc56c97489f;
    stim[35] = 46'h1946da6ff957;
    stim[36] = 46'h35ba61f89896;
    stim[37] = 46'h3560a3510333;
    stim[38] = 46'h3d426fbf3ff1;
    stim[39] = 46'h33985ac9b27e;
    stim[40] = 46'h34d533b7f985;
    stim[41] = 46'h3ae543b618d5;
    stim[42] = 46'h11449c482d28;
    stim[43] = 46'h30482285e44a;
    stim[44] = 46'h21bfd9b28c29;
    stim[45] = 46'h0126144bdd72;
    stim[46] = 46'h1b2e460c0283;
    stim[47] = 46'h2400f5f24293;
    stim[48] = 46'h23f49275b9e2;
    stim[49] = 46'h342eaa06db58;
    stim[50] = 46'h1798724f8dbd;
    stim[51] = 46'h3f2d09c0f2d5;
    stim[52] = 46'h32e3bb42c338;
    stim[53] = 46'h13e2465dc890;
    stim[54] = 46'h06eb0e116d48;
    stim[55] = 46'h091355767f60;
    stim[56] = 46'h12dfba1bbb93;
    stim[57] = 46'h286380cd4473;
    stim[58] = 46'h3b55866c946f;
    stim[59] = 46'h2784ce75b2b1;
    stim[60] = 46'h305d8c97d0b9;
    stim[61] = 46'h1e4a7d8cd459;
    stim[62] = 46'h341255120cb7;
    stim[63] = 46'h0f42a58d7408;
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
      expv[0] = 46'hxxxxxxxxxxxx;
      expv[1] = 46'h2fcdxxxxxxxx;
      expv[2] = 46'h34bdxxxxxxxx;
      expv[3] = 46'h11ccxxxxxxxx;
      expv[4] = 46'h3b42xxxxxxxx;
      expv[5] = 46'h0496xxxxxxxx;
      expv[6] = 46'h1077xxxxxxxx;
      expv[7] = 46'h2d40xxxxxxxx;
      expv[8] = 46'h15d0xxxxxxxx;
      expv[9] = 46'h2152xxxxxxxx;
      expv[10] = 46'h212axxxxxxxx;
      expv[11] = 46'h2b7dxxxxxxxx;
      expv[12] = 46'h2205xxxxxxxx;
      expv[13] = 46'h3c81xxxxxxxx;
      expv[14] = 46'h2459xxxxxxxx;
      expv[15] = 46'h32dcxxxxxxxx;
      expv[16] = 46'h0efexxxxxxxx;
      expv[17] = 46'h17caxxxxxxxx;
      expv[18] = 46'h29ecxxxxxxxx;
      expv[19] = 46'h0872xxxxxxxx;
      expv[20] = 46'h20f0xxxxxxxx;
      expv[21] = 46'h02faxxxxxxxx;
      expv[22] = 46'h2052xxxxxxxx;
      expv[23] = 46'h36b6xxxxxxxx;
      expv[24] = 46'h3337xxxxxxxx;
      expv[25] = 46'h1d64xxxxxxxx;
      expv[26] = 46'h3f06xxxxxxxx;
      expv[27] = 46'h11e4xxxxxxxx;
      expv[28] = 46'h1e75xxxxxxxx;
      expv[29] = 46'h17c6xxxxxxxx;
      expv[30] = 46'h1e6cxxxxxxxx;
      expv[31] = 46'h08b7xxxxxxxx;
      expv[32] = 46'h0b9bxxxxxxxx;
      expv[33] = 46'h2e76xxxxxxxx;
      expv[34] = 46'h32a9xxxxxxxx;
      expv[35] = 46'h089fxxxxxxxx;
      expv[36] = 46'h3957xxxxxxxx;
      expv[37] = 46'h1896xxxxxxxx;
      expv[38] = 46'h0333xxxxxxxx;
      expv[39] = 46'h3ff1xxxxxxxx;
      expv[40] = 46'h327exxxxxxxx;
      expv[41] = 46'h3985xxxxxxxx;
      expv[42] = 46'h18d5xxxxxxxx;
      expv[43] = 46'h2d28xxxxxxxx;
      expv[44] = 46'h244axxxxxxxx;
      expv[45] = 46'h0c29xxxxxxxx;
      expv[46] = 46'h1d72xxxxxxxx;
      expv[47] = 46'h0283xxxxxxxx;
      expv[48] = 46'h0293xxxxxxxx;
      expv[49] = 46'h39e2xxxxxxxx;
      expv[50] = 46'h1b58xxxxxxxx;
      expv[51] = 46'h0dbdxxxxxxxx;
      expv[52] = 46'h32d5xxxxxxxx;
      expv[53] = 46'h0338xxxxxxxx;
      expv[54] = 46'h0890xxxxxxxx;
      expv[55] = 46'h2d48xxxxxxxx;
      expv[56] = 46'h3f60xxxxxxxx;
      expv[57] = 46'h3b93xxxxxxxx;
      expv[58] = 46'h0473xxxxxxxx;
      expv[59] = 46'h146fxxxxxxxx;
      expv[60] = 46'h32b1xxxxxxxx;
      expv[61] = 46'h10b9xxxxxxxx;
      expv[62] = 46'h1459xxxxxxxx;
      expv[63] = 46'h0cb7xxxxxxxx;
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

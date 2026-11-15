// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08116 dut (
    .CLK(clk),
    .DS(in_vec[67:67]),
    .ED(in_vec[66:66]),
    .MPYJ(in_vec[65:65]),
    .C383(in_vec[64:64]),
    .DR(in_vec[63:32]),
    .DI(in_vec[31:0]),
    .DOR(out_vec[63:32]),
    .DOI(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hd485412f689466573;
    stim[1] = 68'h15a7285c7fd481ffd;
    stim[2] = 68'h82d62c292bb5312d2;
    stim[3] = 68'hc813fece9b7475c23;
    stim[4] = 68'h11b3f61ea0929f968;
    stim[5] = 68'h0eb546acef492bbdd;
    stim[6] = 68'hb439b1baeb3efc4cd;
    stim[7] = 68'h9993555d870289263;
    stim[8] = 68'hbaa2afbb43f24a41b;
    stim[9] = 68'h8431fee1119b960d6;
    stim[10] = 68'h1db7a6c1b33a14bc0;
    stim[11] = 68'h043d6bd7a626edc46;
    stim[12] = 68'h7d75506a1a87bf6f4;
    stim[13] = 68'hf24487fd3ba4aece9;
    stim[14] = 68'h85adf775e93b3d5b4;
    stim[15] = 68'h5f5d013467791f263;
    stim[16] = 68'h7dbfcaf97ef865c6f;
    stim[17] = 68'hfae429a4b09fdc398;
    stim[18] = 68'hafbe8623c24c1ac56;
    stim[19] = 68'h1e795dce23d9a2f58;
    stim[20] = 68'hb6ff3ef44a428506a;
    stim[21] = 68'hf100456b7e89a48e4;
    stim[22] = 68'h3ae8675a70bd4e5a7;
    stim[23] = 68'hb09642bf66c72f2d0;
    stim[24] = 68'h65d207cd6622e026f;
    stim[25] = 68'h11551404d8650f53f;
    stim[26] = 68'h790c13dc18f107b8e;
    stim[27] = 68'h75f07c8ffa9db9418;
    stim[28] = 68'h3995a8639d0e7ecb8;
    stim[29] = 68'h8603d8d7daf4ff2cc;
    stim[30] = 68'h38d0f5e246237d0bb;
    stim[31] = 68'haf05a7e2ab2210e8b;
    stim[32] = 68'hb4920f42eda07884c;
    stim[33] = 68'hbc19abdfdcc932dcc;
    stim[34] = 68'h9a97a59ef881b608e;
    stim[35] = 68'h346497570ffe35ca6;
    stim[36] = 68'h0e0c7256fe8d2dea8;
    stim[37] = 68'ha1aaa27bf18c2e7bf;
    stim[38] = 68'hba405e131e532c644;
    stim[39] = 68'h4d6dbc3675ecafada;
    stim[40] = 68'hd2d85034f94dcf05e;
    stim[41] = 68'h2d9d7bb5425d43a5a;
    stim[42] = 68'hb602c34c67e596e85;
    stim[43] = 68'h55a59b1f20a7fcbec;
    stim[44] = 68'h371fdef3eee3eafbf;
    stim[45] = 68'h296cb85b493bde1ab;
    stim[46] = 68'h6d883243201c00494;
    stim[47] = 68'hd16516d29bcde81e3;
    stim[48] = 68'h3542a2c77c710a432;
    stim[49] = 68'hc700c3af9651fd675;
    stim[50] = 68'h96448ecf5749c2088;
    stim[51] = 68'h7e67b31b0ba54fdbd;
    stim[52] = 68'hd4fdcc1ed39349d37;
    stim[53] = 68'h2462d91111e487419;
    stim[54] = 68'hd39f48775f0499046;
    stim[55] = 68'h5b50f7720c1617f9c;
    stim[56] = 68'h2029fd11591dd86d1;
    stim[57] = 68'h7233656b7955a8af6;
    stim[58] = 68'hfa1b2917468842ffe;
    stim[59] = 68'h753b6dd8a5a84bdcd;
    stim[60] = 68'h4b1330cd2da28142c;
    stim[61] = 68'h02ae2b2925379ec4b;
    stim[62] = 68'h3139b56e2847460d3;
    stim[63] = 68'hfdc9c707793936682;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'h1badeca1cf7e6eb1;
      expv[15] = 64'h1badeca1cf7e6eb1;
      expv[16] = 64'hcf7e6eb1e42b970a;
      expv[17] = 64'hcf7e6eb1e42b970a;
      expv[18] = 64'he552dc59f21d6156;
      expv[19] = 64'he552dc59f21d6156;
      expv[20] = 64'he552dc59f21d6156;
      expv[21] = 64'he552dc59f21d6156;
      expv[22] = 64'he552dc59f21d6156;
      expv[23] = 64'he552dc59f21d6156;
      expv[24] = 64'he552dc59f21d6156;
      expv[25] = 64'he552dc59f21d6156;
      expv[26] = 64'he552dc59f21d6156;
      expv[27] = 64'h0621290f1f47f305;
      expv[28] = 64'hf70bcb15f9ded6f1;
      expv[29] = 64'hf70bcb15f9ded6f1;
      expv[30] = 64'hf70bcb15f9ded6f1;
      expv[31] = 64'hf70bcb15f9ded6f1;
      expv[32] = 64'hf70bcb15f9ded6f1;
      expv[33] = 64'hf70bcb15f9ded6f1;
      expv[34] = 64'hf70bcb15f9ded6f1;
      expv[35] = 64'hf70bcb15f9ded6f1;
      expv[36] = 64'hf70bcb15f9ded6f1;
      expv[37] = 64'hf70bcb15f9ded6f1;
      expv[38] = 64'hf70bcb15f9ded6f1;
      expv[39] = 64'hf70bcb15f9ded6f1;
      expv[40] = 64'hf70bcb15f9ded6f1;
      expv[41] = 64'hf70bcb15f9ded6f1;
      expv[42] = 64'hf70bcb15f9ded6f1;
      expv[43] = 64'hf70bcb15f9ded6f1;
      expv[44] = 64'hf70bcb15f9ded6f1;
      expv[45] = 64'hf70bcb15f9ded6f1;
      expv[46] = 64'hf70bcb15f9ded6f1;
      expv[47] = 64'hf70bcb15f9ded6f1;
      expv[48] = 64'h116b7f1cd6ffed1c;
      expv[49] = 64'h116b7f1cd6ffed1c;
      expv[50] = 64'h116b7f1cd6ffed1c;
      expv[51] = 64'h116b7f1cd6ffed1c;
      expv[52] = 64'h116b7f1cd6ffed1c;
      expv[53] = 64'h088a793e2ae12e31;
      expv[54] = 64'h088a793e2ae12e31;
      expv[55] = 64'h2ae12e3126b3071a;
      expv[56] = 64'h2ae12e3126b3071a;
      expv[57] = 64'h2ae12e3126b3071a;
      expv[58] = 64'h1e900356162dcc36;
      expv[59] = 64'h162dcc36f9fca6ee;
      expv[60] = 64'h162dcc36f9fca6ee;
      expv[61] = 64'h162dcc36f9fca6ee;
      expv[62] = 64'h162dcc36f9fca6ee;
      expv[63] = 64'h162dcc36f9fca6ee;
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

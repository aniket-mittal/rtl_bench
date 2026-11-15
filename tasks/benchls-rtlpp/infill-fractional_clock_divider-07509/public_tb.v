// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07509 dut (
    .clk(clk),
    .clk__enable(in_vec[37:37]),
    .divider_control__write_config(in_vec[36:36]),
    .divider_control__write_data(in_vec[35:4]),
    .divider_control__start(in_vec[3:3]),
    .divider_control__stop(in_vec[2:2]),
    .divider_control__disable_fractional(in_vec[1:1]),
    .reset_n(in_vec[0:0]),
    .divider_output__config_data(out_vec[33:2]),
    .divider_output__running(out_vec[1:1]),
    .divider_output__clock_enable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2a23f5239a;
    stim[1] = 38'h13c85a4386;
    stim[2] = 38'h05c39caf5f;
    stim[3] = 38'h09e0d33473;
    stim[4] = 38'h3a228110cf;
    stim[5] = 38'h32450cd9c9;
    stim[6] = 38'h06916f9df5;
    stim[7] = 38'h352d1a6ff9;
    stim[8] = 38'h2a474324d1;
    stim[9] = 38'h1ac577a291;
    stim[10] = 38'h37a1327d40;
    stim[11] = 38'h1cef5e2117;
    stim[12] = 38'h362e99ea39;
    stim[13] = 38'h24dcdb36f7;
    stim[14] = 38'h1742e496a5;
    stim[15] = 38'h0488f3a65f;
    stim[16] = 38'h16148b3bf7;
    stim[17] = 38'h3f0cc830f9;
    stim[18] = 38'h3f34b28b25;
    stim[19] = 38'h0db85e556f;
    stim[20] = 38'h38730d0c9f;
    stim[21] = 38'h2174f49541;
    stim[22] = 38'h007627f547;
    stim[23] = 38'h1952fc1f35;
    stim[24] = 38'h32e5f27149;
    stim[25] = 38'h0ea2ad05cd;
    stim[26] = 38'h16220afae9;
    stim[27] = 38'h36506f21cd;
    stim[28] = 38'h3310e3c42b;
    stim[29] = 38'h1c69343a67;
    stim[30] = 38'h07fb6d796b;
    stim[31] = 38'h1c1ed315db;
    stim[32] = 38'h1593f49fef;
    stim[33] = 38'h2e7772a94f;
    stim[34] = 38'h207de8b9c7;
    stim[35] = 38'h06c3bb3f89;
    stim[36] = 38'h1f5d1b3289;
    stim[37] = 38'h130cdb6019;
    stim[38] = 38'h28be6835dd;
    stim[39] = 38'h0b7b791b93;
    stim[40] = 38'h184feab029;
    stim[41] = 38'h2d7a57c64b;
    stim[42] = 38'h3d90e7ec81;
    stim[43] = 38'h0bd7b93623;
    stim[44] = 38'h277a719283;
    stim[45] = 38'h20964bd4cb;
    stim[46] = 38'h367b3f24dd;
    stim[47] = 38'h0d6070149f;
    stim[48] = 38'h17d7b0ff9f;
    stim[49] = 38'h01f7504961;
    stim[50] = 38'h3fe0357919;
    stim[51] = 38'h111a247ecb;
    stim[52] = 38'h1528feb1fd;
    stim[53] = 38'h2f1374185f;
    stim[54] = 38'h16502d6c63;
    stim[55] = 38'h242f2498b5;
    stim[56] = 38'h39d8633841;
    stim[57] = 38'h2d47ed20bf;
    stim[58] = 38'h1fdc4a8af3;
    stim[59] = 38'h3d17660875;
    stim[60] = 38'h346f73ecf5;
    stim[61] = 38'h2cd6ad90a5;
    stim[62] = 38'h08be7afc0f;
    stim[63] = 38'h0087cdefbb;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h088a04432;
      expv[6] = 34'h091433673;
      expv[7] = 34'h091433673;
      expv[8] = 34'h14b469bfe;
      expv[9] = 34'h14b469bfe;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h18ba67a8e;
      expv[14] = 34'h18ba67a8c;
      expv[15] = 34'h18ba67a8c;
      expv[16] = 34'h18ba67a8c;
      expv[17] = 34'h18ba67a8c;
      expv[18] = 34'h3c3320c3e;
      expv[19] = 34'h3cd2ca2c8;
      expv[20] = 34'h3cd2ca2c8;
      expv[21] = 34'h01cc34326;
      expv[22] = 34'h01cc34326;
      expv[23] = 34'h01cc34326;
      expv[24] = 34'h01cc34326;
      expv[25] = 34'h0b97c9c52;
      expv[26] = 34'h0b97c9c52;
      expv[27] = 34'h0b97c9c52;
      expv[28] = 34'h1941bc872;
      expv[29] = 34'h0c438f10a;
      expv[30] = 34'h0c438f10a;
      expv[31] = 34'h0c438f10a;
      expv[32] = 34'h0c438f10a;
      expv[33] = 34'h0c438f10a;
      expv[34] = 34'h0c438f10a;
      expv[35] = 34'h0c438f108;
      expv[36] = 34'h0c438f108;
      expv[37] = 34'h0c438f108;
      expv[38] = 34'h0c438f108;
      expv[39] = 34'h0c438f10a;
      expv[40] = 34'h0c438f10a;
      expv[41] = 34'h0c438f10a;
      expv[42] = 34'h0c438f10a;
      expv[43] = 34'h36439fb22;
      expv[44] = 34'h36439fb22;
      expv[45] = 34'h16439fb22;
      expv[46] = 34'h16439fb22;
      expv[47] = 34'h19ecfc936;
      expv[48] = 34'h19ecfc936;
      expv[49] = 34'h19ecfc936;
      expv[50] = 34'h19ecfc936;
      expv[51] = 34'h3f80d5e46;
      expv[52] = 34'h3f80d5e46;
      expv[53] = 34'h3f80d5e46;
      expv[54] = 34'h1f80d5e46;
      expv[55] = 34'h1f80d5e46;
      expv[56] = 34'h1f80d5e44;
      expv[57] = 34'h27618ce10;
      expv[58] = 34'h07618ce12;
      expv[59] = 34'h07618ce12;
      expv[60] = 34'h345d9821c;
      expv[61] = 34'h11bdcfb3c;
      expv[62] = 34'h11bdcfb3c;
      expv[63] = 34'h11bdcfb3c;
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

// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09296 dut (
    .clk(clk),
    .rst(in_vec[35:35]),
    .FLIT_in(in_vec[34:3]),
    .VALID_in(in_vec[2:2]),
    .FWDAUX1_in(in_vec[1:1]),
    .busy_out(in_vec[0:0]),
    .BWDAUX1_out(out_vec[35:35]),
    .BWDAUX2_out(out_vec[34:34]),
    .BWDAUX3_out(out_vec[33:33]),
    .flit_out(out_vec[32:1]),
    .request_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hf2a710d6e;
    stim[1] = 36'hd245edb40;
    stim[2] = 36'h7f47a5914;
    stim[3] = 36'h78ca8454d;
    stim[4] = 36'h259c980d5;
    stim[5] = 36'h74cf7049d;
    stim[6] = 36'h4a129f1a4;
    stim[7] = 36'h312babdfa;
    stim[8] = 36'h008606ac7;
    stim[9] = 36'h7b6ef0193;
    stim[10] = 36'h287124652;
    stim[11] = 36'h2f42452a8;
    stim[12] = 36'h52027f6d7;
    stim[13] = 36'h607966f68;
    stim[14] = 36'h710c54fd1;
    stim[15] = 36'h3603c44f3;
    stim[16] = 36'h26610eb7c;
    stim[17] = 36'h18de8ce29;
    stim[18] = 36'h4e4169868;
    stim[19] = 36'h1266be9f0;
    stim[20] = 36'h706a079a2;
    stim[21] = 36'h36d056c74;
    stim[22] = 36'h1cff756d8;
    stim[23] = 36'h076747e3d;
    stim[24] = 36'h506998e7b;
    stim[25] = 36'h111c8b17e;
    stim[26] = 36'h09a0c062d;
    stim[27] = 36'h07690e5eb;
    stim[28] = 36'h5cda473f1;
    stim[29] = 36'h44abdc144;
    stim[30] = 36'h16b812570;
    stim[31] = 36'h311d90d18;
    stim[32] = 36'h185612ebd;
    stim[33] = 36'h5a67bada8;
    stim[34] = 36'h57e048b32;
    stim[35] = 36'h308e53d30;
    stim[36] = 36'h3595c7eda;
    stim[37] = 36'h2edd180b2;
    stim[38] = 36'h3ce5056bf;
    stim[39] = 36'h793dcf695;
    stim[40] = 36'h0fe1b458a;
    stim[41] = 36'h41037ab22;
    stim[42] = 36'h23d1f2bc3;
    stim[43] = 36'h5e1b760a6;
    stim[44] = 36'h68bd58d40;
    stim[45] = 36'h5003e4082;
    stim[46] = 36'h2b001dbdc;
    stim[47] = 36'h2e881c968;
    stim[48] = 36'h3e79cca19;
    stim[49] = 36'h1ac2c3a86;
    stim[50] = 36'h6fbf291ba;
    stim[51] = 36'h635189050;
    stim[52] = 36'h721b7025c;
    stim[53] = 36'h13e24691e;
    stim[54] = 36'h3676d0b89;
    stim[55] = 36'h18a7ecef4;
    stim[56] = 36'h240bb1183;
    stim[57] = 36'h2b188af82;
    stim[58] = 36'h3653d1526;
    stim[59] = 36'h40b4fd5bc;
    stim[60] = 36'h23f9c4b43;
    stim[61] = 36'h3461f357c;
    stim[62] = 36'h22c39e310;
    stim[63] = 36'h30972c7bf;
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
      expv[0] = 36'h000000000;
      expv[1] = 36'h000000000;
      expv[2] = 36'h000000000;
      expv[3] = 36'h1fd1e9645;
      expv[4] = 36'h1fd1e9645;
      expv[5] = 36'h1fd1e9645;
      expv[6] = 36'h1fd1e9645;
      expv[7] = 36'h1e32a1153;
      expv[8] = 36'h096726035;
      expv[9] = 36'h096726035;
      expv[10] = 36'h096726035;
      expv[11] = 36'h1d33dc127;
      expv[12] = 36'h1284a7c69;
      expv[13] = 36'h1284a7c69;
      expv[14] = 36'h002181ab1;
      expv[15] = 36'h002181ab1;
      expv[16] = 36'h002181ab1;
      expv[17] = 36'h14809fdb5;
      expv[18] = 36'h14809fdb5;
      expv[19] = 36'h099843adf;
      expv[20] = 36'h099843ade;
      expv[21] = 36'h099843ade;
      expv[22] = 36'h0db415b1d;
      expv[23] = 36'h0db415b1c;
      expv[24] = 36'h01d9d1f8f;
      expv[25] = 36'h01d9d1f8f;
      expv[26] = 36'h044722c5f;
      expv[27] = 36'h044722c5f;
      expv[28] = 36'h044722c5f;
      expv[29] = 36'h044722c5f;
      expv[30] = 36'h02683018b;
      expv[31] = 36'h112af7051;
      expv[32] = 36'h112af7050;
      expv[33] = 36'h061584baf;
      expv[34] = 36'h061584bae;
      expv[35] = 36'h061584bae;
      expv[36] = 36'h061584bae;
      expv[37] = 36'h061584bae;
      expv[38] = 36'h061584bae;
      expv[39] = 36'h0f39415af;
      expv[40] = 36'h0f39415af;
      expv[41] = 36'h1e4f73da5;
      expv[42] = 36'h1e4f73da4;
      expv[43] = 36'h1e4f73da4;
      expv[44] = 36'h1786dd829;
      expv[45] = 36'h1786dd828;
      expv[46] = 36'h1786dd828;
      expv[47] = 36'h0ac0076f7;
      expv[48] = 36'h0ac0076f6;
      expv[49] = 36'h0ac0076f6;
      expv[50] = 36'h06b0b0ea1;
      expv[51] = 36'h06b0b0ea0;
      expv[52] = 36'h06b0b0ea0;
      expv[53] = 36'h1c86dc097;
      expv[54] = 36'h04f891a47;
      expv[55] = 36'h04f891a47;
      expv[56] = 36'h0629fb3bd;
      expv[57] = 36'h0629fb3bd;
      expv[58] = 36'h0629fb3bc;
      expv[59] = 36'h0d94f4549;
      expv[60] = 36'h102d3f56f;
      expv[61] = 36'h102d3f56f;
      expv[62] = 36'h0d187cd5f;
      expv[63] = 36'h0d187cd5e;
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

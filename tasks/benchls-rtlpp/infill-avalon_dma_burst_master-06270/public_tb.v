// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06270 dut (
    .clk(clk),
    .reset(in_vec[86:86]),
    .sw_reset(in_vec[85:85]),
    .sw_stop(in_vec[84:84]),
    .length(in_vec[83:52]),
    .eop_enabled(in_vec[51:51]),
    .eop(in_vec[50:50]),
    .ready(in_vec[49:49]),
    .valid(in_vec[48:48]),
    .early_termination(in_vec[47:47]),
    .address_in(in_vec[46:15]),
    .write_in(in_vec[14:14]),
    .max_burst_count(in_vec[13:11]),
    .write_fifo_used(in_vec[10:5]),
    .waitrequest(in_vec[4:4]),
    .short_first_access_enable(in_vec[3:3]),
    .short_last_access_enable(in_vec[2:2]),
    .short_first_and_last_access_enable(in_vec[1:1]),
    .last_access(in_vec[0:0]),
    .address_out(out_vec[38:7]),
    .write_out(out_vec[6:6]),
    .burst_count(out_vec[5:3]),
    .stall(out_vec[2:2]),
    .reset_taken(out_vec[1:1]),
    .stopped(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h5276f4ee2a1a4a0faf9959;
    stim[1] = 87'h5da63c6404189c674e37e6;
    stim[2] = 87'h1bd313750b1304753bea7e;
    stim[3] = 87'h07b7f3b91d9e3675efd0dd;
    stim[4] = 87'h081648b37dc00e5c54a109;
    stim[5] = 87'h3c266abac2a87b2cf0fb70;
    stim[6] = 87'h0336902ea012cc82b72695;
    stim[7] = 87'h2d31cfcfc737e89a7b9725;
    stim[8] = 87'h38414445106f10f1199dc3;
    stim[9] = 87'h1aa4fdf81a3c409ee4f9ab;
    stim[10] = 87'h0abb50b91c7256c42ffbab;
    stim[11] = 87'h13cc20a073f92f850e30ec;
    stim[12] = 87'h330176c74fba649787251e;
    stim[13] = 87'h15f371f78c7b5ecc345d3e;
    stim[14] = 87'h378d6e9f9a02dd95d71566;
    stim[15] = 87'h0898df15c28fe1d4737cc0;
    stim[16] = 87'h10973046d69ab23f466514;
    stim[17] = 87'h27b8e5c5195ac0115dbd7f;
    stim[18] = 87'h2eedcaff715c552de49ecc;
    stim[19] = 87'h111591805cabf91b3def8d;
    stim[20] = 87'h0ad913e72d54731abc9e55;
    stim[21] = 87'h3504355e388fcc2a7b5f14;
    stim[22] = 87'h3e055277dc3c7414b5ee64;
    stim[23] = 87'h086e61f29b0528a8eab196;
    stim[24] = 87'h3c8e3ecd6485c2021822e5;
    stim[25] = 87'h25a7a969819aa825e9b48e;
    stim[26] = 87'h2e4f9131bbcd7844c4ffeb;
    stim[27] = 87'h2bba009a49c73ed7aca425;
    stim[28] = 87'h03fe8d08a36160e1b143ac;
    stim[29] = 87'h38a22b3f21770ddd2fd032;
    stim[30] = 87'h04cc4bdbf631ede976b103;
    stim[31] = 87'h132bc37c0a0fe94d511ad3;
    stim[32] = 87'h17b45f60798a2e9f22db6d;
    stim[33] = 87'h1a81a873b1979fd8a9322f;
    stim[34] = 87'h3eebde81be710045ed43e6;
    stim[35] = 87'h0c53675c96324610121a30;
    stim[36] = 87'h268471f110eddcf0c62af6;
    stim[37] = 87'h024b65f80d577ca0acd69d;
    stim[38] = 87'h26a8e3b424cab7e2242c8a;
    stim[39] = 87'h3f7e1d1e984d22de270a64;
    stim[40] = 87'h3a26373a93882d7752c7b1;
    stim[41] = 87'h2dd962bae108863c1ebc23;
    stim[42] = 87'h39fb440dbfa0014db479be;
    stim[43] = 87'h17f04b8990b2e819e40bef;
    stim[44] = 87'h0d949c1d0818b0aa1f7a9c;
    stim[45] = 87'h0b675d47abc72899c83360;
    stim[46] = 87'h15fed5406153ecd82185da;
    stim[47] = 87'h0a3b9cf2c0b494f65627ad;
    stim[48] = 87'h2528db79f9b52fd20a8104;
    stim[49] = 87'h39f11da9cb18a99c39450e;
    stim[50] = 87'h177061db51d5b350d736a3;
    stim[51] = 87'h38dc59328bdf93a0a5fcdd;
    stim[52] = 87'h29bcb0209fad7eef58b4f1;
    stim[53] = 87'h2f153998a854ff6242b90f;
    stim[54] = 87'h38e4dd6439dfd1aed1c7d7;
    stim[55] = 87'h31ee24190e9b2461ea2a71;
    stim[56] = 87'h2c3a3fd727ac197f767d02;
    stim[57] = 87'h095ed977259544fd61b0ee;
    stim[58] = 87'h1d7c275d5576888978405a;
    stim[59] = 87'h3183ace1da103499df53d9;
    stim[60] = 87'h3093a019d9f6eb10e01066;
    stim[61] = 87'h3fe44bf82af62145b6d12a;
    stim[62] = 87'h1924f33ffb79857bea95de;
    stim[63] = 87'h3a951782738b1b787f6898;
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
      expv[0] = 39'h0000000005;
      expv[1] = 39'h0000000005;
      expv[2] = 39'h0000000005;
      expv[3] = 39'h1304753b8c;
      expv[4] = 39'h1e3675efc8;
      expv[5] = 39'h1e3675ef8f;
      expv[6] = 39'h287b2cf08c;
      expv[7] = 39'h287b2cf08e;
      expv[8] = 39'h287b2cf08f;
      expv[9] = 39'h287b2cf08d;
      expv[10] = 39'h3c409ee48c;
      expv[11] = 39'h7256c42fc8;
      expv[12] = 39'h7256c42f8f;
      expv[13] = 39'h7256c42f8d;
      expv[14] = 39'h7b5ecc340f;
      expv[15] = 39'h7b5ecc340c;
      expv[16] = 39'h0fe1d47348;
      expv[17] = 39'h0fe1d47348;
      expv[18] = 39'h0fe1d47348;
      expv[19] = 39'h0fe1d4730d;
      expv[20] = 39'h2bf91b3d8c;
      expv[21] = 39'h2bf91b3d8f;
      expv[22] = 39'h0fcc2a7b0f;
      expv[23] = 39'h3c7414b58c;
      expv[24] = 39'h3c7414b58f;
      expv[25] = 39'h3c7414b58e;
      expv[26] = 39'h3c7414b58e;
      expv[27] = 39'h4d7844c48e;
      expv[28] = 39'h4d7844c48c;
      expv[29] = 39'h6160e1b148;
      expv[30] = 39'h6160e1b148;
      expv[31] = 39'h6160e1b10d;
      expv[32] = 39'h6160e1b10d;
      expv[33] = 39'h0a2e9f228d;
      expv[34] = 39'h0a2e9f228f;
      expv[35] = 39'h710045ed0c;
      expv[36] = 39'h710045ed0e;
      expv[37] = 39'h710045ed0c;
      expv[38] = 39'h577ca0acc8;
      expv[39] = 39'h577ca0ac8f;
      expv[40] = 39'h577ca0ac8f;
      expv[41] = 39'h082d77528e;
      expv[42] = 39'h082d77528f;
      expv[43] = 39'h20014db40d;
      expv[44] = 39'h20014db40c;
      expv[45] = 39'h18b0aa1f48;
      expv[46] = 39'h18b0aa1f0d;
      expv[47] = 39'h18b0aa1f0c;
      expv[48] = 39'h18b0aa1f0e;
      expv[49] = 39'h18b0aa1f0f;
      expv[50] = 39'h18a99c390d;
      expv[51] = 39'h18a99c390f;
      expv[52] = 39'h5f93a0a58e;
      expv[53] = 39'h5f93a0a58e;
      expv[54] = 39'h5f93a0a58f;
      expv[55] = 39'h5fd1aed18f;
      expv[56] = 39'h5fd1aed18e;
      expv[57] = 39'h2c197f760c;
      expv[58] = 39'h2c197f760d;
      expv[59] = 39'h768889780f;
      expv[60] = 39'h103499df0f;
      expv[61] = 39'h103499df0f;
      expv[62] = 39'h762145b68d;
      expv[63] = 39'h762145b68f;
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

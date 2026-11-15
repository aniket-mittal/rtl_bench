// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  plc_list dut (
    .clk(clk),
    .rst(in_vec[39:39]),
    .add_addr_tuple(in_vec[38:23]),
    .add_way_tuple(in_vec[22:15]),
    .add_flag(in_vec[14:14]),
    .store_addr(in_vec[13:6]),
    .store_addr_w(in_vec[5:2]),
    .store_flag(in_vec[1:1]),
    .fetch_flag(in_vec[0:0]),
    .add_done(out_vec[30:30]),
    .store_done(out_vec[29:29]),
    .fetch_done(out_vec[28:28]),
    .fetch_addr_tuple(out_vec[27:12]),
    .fetch_way_tuple(out_vec[11:4]),
    .fetch_none(out_vec[3:3]),
    .req_error(out_vec[2:2]),
    .plc_check_flag(out_vec[1:1]),
    .last_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h92d94ea844;
    stim[1] = 40'hcfc93742c0;
    stim[2] = 40'h6515ef2163;
    stim[3] = 40'h42bf05ed80;
    stim[4] = 40'h3c30ed3c1c;
    stim[5] = 40'h7c2a419555;
    stim[6] = 40'h282022d028;
    stim[7] = 40'hd6ed50dfba;
    stim[8] = 40'h71324119d3;
    stim[9] = 40'h0dd2442f85;
    stim[10] = 40'h03762ea98f;
    stim[11] = 40'h64ecf1957e;
    stim[12] = 40'h49afd82310;
    stim[13] = 40'h2b37df47fa;
    stim[14] = 40'h2314a92b88;
    stim[15] = 40'h30b76646c4;
    stim[16] = 40'h1cb7863e58;
    stim[17] = 40'h2cf050eb5e;
    stim[18] = 40'h0d5622756e;
    stim[19] = 40'h30e14b1eea;
    stim[20] = 40'h6b19a19ba9;
    stim[21] = 40'h44964c48ae;
    stim[22] = 40'h312927ebe9;
    stim[23] = 40'h29e3972e18;
    stim[24] = 40'h6a4be1e3a7;
    stim[25] = 40'h2f296b5d68;
    stim[26] = 40'hac9f0a3d3c;
    stim[27] = 40'h271d4e60c7;
    stim[28] = 40'h293ead2549;
    stim[29] = 40'h0d01511d5c;
    stim[30] = 40'h20867ec193;
    stim[31] = 40'h71c1e648ee;
    stim[32] = 40'h7e52e28136;
    stim[33] = 40'h4983ffcbe0;
    stim[34] = 40'h29200a33a6;
    stim[35] = 40'h72df771eca;
    stim[36] = 40'h39cf05f6f4;
    stim[37] = 40'h1eacebc8c2;
    stim[38] = 40'h158bcf1b52;
    stim[39] = 40'hd764a5aa9b;
    stim[40] = 40'h3e14bd8090;
    stim[41] = 40'h253d6dea96;
    stim[42] = 40'h4c6acf9991;
    stim[43] = 40'h558ea0edf9;
    stim[44] = 40'h2d27f55508;
    stim[45] = 40'h113f67e3ba;
    stim[46] = 40'h716394fa07;
    stim[47] = 40'h21547d3d89;
    stim[48] = 40'h3113fc343f;
    stim[49] = 40'h49f8477bf9;
    stim[50] = 40'h4b3d6ec471;
    stim[51] = 40'h7f1ec26f4e;
    stim[52] = 40'h609f4a90b0;
    stim[53] = 40'h704e061716;
    stim[54] = 40'h49116f18cf;
    stim[55] = 40'h54c43d5bef;
    stim[56] = 40'h05e2716078;
    stim[57] = 40'h507e36bd81;
    stim[58] = 40'h038be382c3;
    stim[59] = 40'h4c4ca68ee4;
    stim[60] = 40'h47274c58c8;
    stim[61] = 40'h42b4ff521f;
    stim[62] = 40'h767ad81cb0;
    stim[63] = 40'h1670456136;
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
      expv[0] = 31'h00000005;
      expv[1] = 31'h00000005;
      expv[2] = 31'h00000005;
      expv[3] = 31'h3000000d;
      expv[4] = 31'h4000000c;
      expv[5] = 31'h0000000c;
      expv[6] = 31'h1857e0b5;
      expv[7] = 31'h00000005;
      expv[8] = 31'h00000005;
      expv[9] = 31'h3000000d;
      expv[10] = 31'h1000000d;
      expv[11] = 31'h3000000d;
      expv[12] = 31'h2000000d;
      expv[13] = 31'h0000000d;
      expv[14] = 31'h6000000c;
      expv[15] = 31'h0000000c;
      expv[16] = 31'h4000000c;
      expv[17] = 31'h0000000c;
      expv[18] = 31'h6000000c;
      expv[19] = 31'h6000000c;
      expv[20] = 31'h2000000c;
      expv[21] = 31'h1566fbe4;
      expv[22] = 31'h6566fbe4;
      expv[23] = 31'h5616ecc4;
      expv[24] = 31'h0616ecc4;
      expv[25] = 31'h759e0a14;
      expv[26] = 31'h00000005;
      expv[27] = 31'h00000005;
      expv[28] = 31'h7000000c;
      expv[29] = 31'h14e3a9c5;
      expv[30] = 31'h04e3a9c5;
      expv[31] = 31'h74e3a9cc;
      expv[32] = 31'h64e3a9cc;
      expv[33] = 31'h24e3a9cc;
      expv[34] = 31'h44e3a9cc;
      expv[35] = 31'h24e3a9cc;
      expv[36] = 31'h24e3a9cc;
      expv[37] = 31'h44e3a9cc;
      expv[38] = 31'h64e3a9cc;
      expv[39] = 31'h00000005;
      expv[40] = 31'h00000005;
      expv[41] = 31'h00000005;
      expv[42] = 31'h60000004;
      expv[43] = 31'h14a7adb5;
      expv[44] = 31'h54a7adbc;
      expv[45] = 31'h44a7adbc;
      expv[46] = 31'h64a7adbc;
      expv[47] = 31'h74a7adb4;
      expv[48] = 31'h1ab1d414;
      expv[49] = 31'h35a4fea4;
      expv[50] = 31'h5227ecf4;
      expv[51] = 31'h5e2c7294;
      expv[52] = 31'h6e2c7294;
      expv[53] = 31'h0e2c7294;
      expv[54] = 31'h2e2c7294;
      expv[55] = 31'h393f08e4;
      expv[56] = 31'h7967add4;
      expv[57] = 31'h4967add4;
      expv[58] = 31'h1fe3d844;
      expv[59] = 31'h3a9887a4;
      expv[60] = 31'h0a9887a4;
      expv[61] = 31'h4a9887a4;
      expv[62] = 31'h70bc4e24;
      expv[63] = 31'h00bc4e24;
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

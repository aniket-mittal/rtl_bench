// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 162;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148357 dut (
    .clk(clk),
    .mwaddr(in_vec[30:25]),
    .mraddr(in_vec[24:19]),
    .win_ready(in_vec[18:18]),
    .win_valid(in_vec[17:17]),
    .mrdata_s(in_vec[16:0]),
    .mrd(out_vec[161:161]),
    .mrvalid(out_vec[160:160]),
    .mrdata(out_vec[159:143]),
    .mdata_0(out_vec[142:126]),
    .mdata_1(out_vec[125:109]),
    .mdata_2(out_vec[108:92]),
    .mdata_3(out_vec[91:75]),
    .mvalid_0(out_vec[74:74]),
    .mvalid_1(out_vec[73:73]),
    .mvalid_2(out_vec[72:72]),
    .mvalid_3(out_vec[71:71]),
    .win_last(out_vec[70:70]),
    .win_data(out_vec[69:2]),
    .adc_ready(out_vec[1:1]),
    .win_valid_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h57dda4df;
    stim[1] = 31'h263f3b06;
    stim[2] = 31'h7227cb13;
    stim[3] = 31'h20bd5da8;
    stim[4] = 31'h78aece34;
    stim[5] = 31'h7da34e07;
    stim[6] = 31'h56842d39;
    stim[7] = 31'h7d9d31bd;
    stim[8] = 31'h42afdc1d;
    stim[9] = 31'h58d4df50;
    stim[10] = 31'h3d79df69;
    stim[11] = 31'h712032e7;
    stim[12] = 31'h713b9b75;
    stim[13] = 31'h3fbf0cb2;
    stim[14] = 31'h36b51897;
    stim[15] = 31'h4cae91e5;
    stim[16] = 31'h11810769;
    stim[17] = 31'h740a169e;
    stim[18] = 31'h496dda08;
    stim[19] = 31'h533a60a9;
    stim[20] = 31'h18d88a0b;
    stim[21] = 31'h70cb4681;
    stim[22] = 31'h42aab516;
    stim[23] = 31'h3963a6fd;
    stim[24] = 31'h64f93415;
    stim[25] = 31'h136ffd1b;
    stim[26] = 31'h192b68c1;
    stim[27] = 31'h7045b395;
    stim[28] = 31'h48486dc0;
    stim[29] = 31'h45ced4e1;
    stim[30] = 31'h67e2c984;
    stim[31] = 31'h46748396;
    stim[32] = 31'h55ef6a3b;
    stim[33] = 31'h1be1d247;
    stim[34] = 31'h217a6c61;
    stim[35] = 31'h5bedc807;
    stim[36] = 31'h5fd6b2ec;
    stim[37] = 31'h32b6c412;
    stim[38] = 31'h434f8961;
    stim[39] = 31'h5f4f33f8;
    stim[40] = 31'h6c105d31;
    stim[41] = 31'h728eedf6;
    stim[42] = 31'h01f3f310;
    stim[43] = 31'h4b3ed689;
    stim[44] = 31'h3125039b;
    stim[45] = 31'h010a309c;
    stim[46] = 31'h43a18228;
    stim[47] = 31'h10217dc0;
    stim[48] = 31'h6d376c37;
    stim[49] = 31'h71012d5c;
    stim[50] = 31'h4f39c6b6;
    stim[51] = 31'h57abdc4b;
    stim[52] = 31'h41e6abfd;
    stim[53] = 31'h6ae14a4f;
    stim[54] = 31'h24923b13;
    stim[55] = 31'h4f7e2208;
    stim[56] = 31'h5dd8e276;
    stim[57] = 31'h2d70297c;
    stim[58] = 31'h232891ee;
    stim[59] = 31'h62d73fe7;
    stim[60] = 31'h2e2eb218;
    stim[61] = 31'h7f4d5269;
    stim[62] = 31'h0b925da3;
    stim[63] = 31'h1725ee5c;
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
      expv[0] = 162'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 162'hxd26fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 162'h39d83xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 162'h3e589xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 162'h3aed4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 162'h3671axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 162'h1a703xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 162'h2169cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 162'h398dexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 162'h3ee0exxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 162'h36fa8xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 162'h1efb4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 162'h01973xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 162'h0cdbaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 162'h28659xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 162'h38c4bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 162'h348f2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 162'h183b4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 162'h00b4fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 162'h2ed04xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 162'h13054xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 162'h04505xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 162'h0a340xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 162'h05a8bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 162'h0d37exxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 162'h09a0axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 162'h2fe8dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 162'h1b460xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 162'h2d9caxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 162'h136e0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 162'h26a70xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 162'h164c2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 162'h241cbxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 162'h3b51dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 162'h1e923xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 162'h03630xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 162'h2e403xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 162'h35976xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 162'h36209xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 162'h3c4b0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 162'h399fcxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 162'h12e98xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 162'h276fbxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 162'h1f988xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 162'h26b44xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 162'h381cdxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 162'h1184exxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 162'h0c114xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 162'h0bee0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 162'h2b61bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 162'h196aexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 162'h0e35bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 162'h0ee25xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 162'h255fexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 162'h1a527xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 162'h01d89xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 162'h21104xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 162'h1713bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 162'h014bexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 162'h048f7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 162'h29ff3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 162'h3590cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 162'h3a934xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 162'h12ed1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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

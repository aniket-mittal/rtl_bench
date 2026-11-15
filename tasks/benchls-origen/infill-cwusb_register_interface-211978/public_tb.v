// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_211978 dut (
    .cwusb_clk(clk),
    .cwusb_din(in_vec[27:20]),
    .cwusb_addr(in_vec[19:12]),
    .cwusb_rdn(in_vec[11:11]),
    .cwusb_wrn(in_vec[10:10]),
    .cwusb_cen(in_vec[9:9]),
    .I_drive_data(in_vec[8:8]),
    .reg_datai(in_vec[7:0]),
    .cwusb_dout(out_vec[31:24]),
    .cwusb_isout(out_vec[23:23]),
    .reg_address(out_vec[22:15]),
    .reg_bytecnt(out_vec[14:11]),
    .reg_datao(out_vec[10:3]),
    .reg_read(out_vec[2:2]),
    .reg_write(out_vec[1:1]),
    .reg_addrvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h773d857;
    stim[1] = 28'ha3c8241;
    stim[2] = 28'h86488b5;
    stim[3] = 28'h0b373d6;
    stim[4] = 28'h0ed4d6f;
    stim[5] = 28'h0fcec96;
    stim[6] = 28'h33de53e;
    stim[7] = 28'hd60e41f;
    stim[8] = 28'h951548f;
    stim[9] = 28'h13f69e8;
    stim[10] = 28'h5a6a260;
    stim[11] = 28'h33262c9;
    stim[12] = 28'hbc40f22;
    stim[13] = 28'h70975f2;
    stim[14] = 28'h34f248b;
    stim[15] = 28'hd591554;
    stim[16] = 28'h794db39;
    stim[17] = 28'h0cd41ce;
    stim[18] = 28'he3b1b12;
    stim[19] = 28'h2c22dd8;
    stim[20] = 28'hfeaf8a3;
    stim[21] = 28'h2594ae9;
    stim[22] = 28'hd4f1ff6;
    stim[23] = 28'h30d24da;
    stim[24] = 28'h3750a92;
    stim[25] = 28'h183e6b7;
    stim[26] = 28'hb9875e4;
    stim[27] = 28'h9d00901;
    stim[28] = 28'h82063a9;
    stim[29] = 28'h0dac4ad;
    stim[30] = 28'h8cae90b;
    stim[31] = 28'h085b505;
    stim[32] = 28'hcf19251;
    stim[33] = 28'h44f82fe;
    stim[34] = 28'h05458bf;
    stim[35] = 28'h1fce733;
    stim[36] = 28'h3b456d6;
    stim[37] = 28'h76839e1;
    stim[38] = 28'h198d961;
    stim[39] = 28'h65c86f8;
    stim[40] = 28'hd3cdf1e;
    stim[41] = 28'h80d3791;
    stim[42] = 28'h134b8c9;
    stim[43] = 28'hf6b556f;
    stim[44] = 28'h8dbcc7e;
    stim[45] = 28'h0c7e677;
    stim[46] = 28'ha70944b;
    stim[47] = 28'h16825a7;
    stim[48] = 28'h972686e;
    stim[49] = 28'ha71b5ce;
    stim[50] = 28'h26044c2;
    stim[51] = 28'h45bb64a;
    stim[52] = 28'ha5ac4aa;
    stim[53] = 28'h39e497a;
    stim[54] = 28'h4eea59d;
    stim[55] = 28'hf1ce88c;
    stim[56] = 28'h5caae60;
    stim[57] = 28'hba1644d;
    stim[58] = 28'h0f9ba0b;
    stim[59] = 28'h1e963bb;
    stim[60] = 28'h171c7bf;
    stim[61] = 28'hcc7858e;
    stim[62] = 28'hff271f5;
    stim[63] = 28'h3da4844;
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
      expv[0] = 32'h57xexxbx;
      expv[1] = 32'h41x4xx19;
      expv[2] = 32'hb5x4xx31;
      expv[3] = 32'hd61bxx59;
      expv[4] = 32'h6f6axx71;
      expv[5] = 32'h9667xx79;
      expv[6] = 32'h3e6fxx99;
      expv[7] = 32'h1f07xxb1;
      expv[8] = 32'h8f0axxa9;
      expv[9] = 32'he87bxx99;
      expv[10] = 32'h6035xxd1;
      expv[11] = 32'hc913xx99;
      expv[12] = 32'h2220xxe3;
      expv[13] = 32'hf24bxx81;
      expv[14] = 32'h8b79xxa1;
      expv[15] = 32'h5448xxa9;
      expv[16] = 32'h3926xxc9;
      expv[17] = 32'hce6axx65;
      expv[18] = 32'h1258xx19;
      expv[19] = 32'hd891xx65;
      expv[20] = 32'ha357xxf1;
      expv[21] = 32'he9caxx29;
      expv[22] = 32'hf678xxa7;
      expv[23] = 32'hda69xx81;
      expv[24] = 32'h92a8xxb9;
      expv[25] = 32'hb71fxxc7;
      expv[26] = 32'he443xxc9;
      expv[27] = 32'h0180xxe9;
      expv[28] = 32'ha903xx11;
      expv[29] = 32'had56xx69;
      expv[30] = 32'h0b57xx61;
      expv[31] = 32'h052dxx41;
      expv[32] = 32'h510cxx79;
      expv[33] = 32'hfe7cxx21;
      expv[34] = 32'hbf22xx29;
      expv[35] = 32'h3367xxfb;
      expv[36] = 32'hd622xxd9;
      expv[37] = 32'he141xxb1;
      expv[38] = 32'h6146xxc9;
      expv[39] = 32'hf864xx2b;
      expv[40] = 32'h1e66xx99;
      expv[41] = 32'h9169xx01;
      expv[42] = 32'hc925xx99;
      expv[43] = 32'h6f5axxb1;
      expv[44] = 32'h7e5exx69;
      expv[45] = 32'h773fxx61;
      expv[46] = 32'h4b04xx39;
      expv[47] = 32'ha741xxb1;
      expv[48] = 32'h6e13xxb9;
      expv[49] = 32'hce0dxx39;
      expv[50] = 32'hc202xx31;
      expv[51] = 32'h4a5dxx29;
      expv[52] = 32'haa56xx29;
      expv[53] = 32'h7a72xxc9;
      expv[54] = 32'h9d75xx71;
      expv[55] = 32'h8c67xx89;
      expv[56] = 32'h6055xxe3;
      expv[57] = 32'h4d0bxxd1;
      expv[58] = 32'h0b4dxx79;
      expv[59] = 32'hbb4bxxf5;
      expv[60] = 32'hbf0exxbb;
      expv[61] = 32'h8ebcxx61;
      expv[62] = 32'hf513xxf9;
      expv[63] = 32'h4452xxe9;
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

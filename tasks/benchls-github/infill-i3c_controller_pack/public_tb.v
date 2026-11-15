// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  i3c_controller_pack dut (
    .clk(clk),
    .reset_n(in_vec[11:11]),
    .u32_ready(in_vec[10:10]),
    .u8_valid(in_vec[9:9]),
    .u8_last(in_vec[8:8]),
    .u8(in_vec[7:0]),
    .u32_valid(out_vec[45:45]),
    .u32(out_vec[44:13]),
    .u8_lvl(out_vec[12:1]),
    .u8_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h2b6;
    stim[1] = 12'h442;
    stim[2] = 12'h9e3;
    stim[3] = 12'h8b5;
    stim[4] = 12'hd24;
    stim[5] = 12'h938;
    stim[6] = 12'hd2d;
    stim[7] = 12'hf8c;
    stim[8] = 12'hfda;
    stim[9] = 12'hd9c;
    stim[10] = 12'hf22;
    stim[11] = 12'hde8;
    stim[12] = 12'hd04;
    stim[13] = 12'ha70;
    stim[14] = 12'ha1b;
    stim[15] = 12'hf91;
    stim[16] = 12'hdef;
    stim[17] = 12'hf76;
    stim[18] = 12'ha95;
    stim[19] = 12'hc1b;
    stim[20] = 12'h150;
    stim[21] = 12'hdf1;
    stim[22] = 12'ha12;
    stim[23] = 12'hfa1;
    stim[24] = 12'hd7c;
    stim[25] = 12'h36b;
    stim[26] = 12'hddb;
    stim[27] = 12'hed7;
    stim[28] = 12'hcbe;
    stim[29] = 12'hf93;
    stim[30] = 12'hc54;
    stim[31] = 12'he8a;
    stim[32] = 12'hef2;
    stim[33] = 12'h824;
    stim[34] = 12'hb21;
    stim[35] = 12'ha13;
    stim[36] = 12'hfa8;
    stim[37] = 12'hf96;
    stim[38] = 12'hf1b;
    stim[39] = 12'hecb;
    stim[40] = 12'hef4;
    stim[41] = 12'h888;
    stim[42] = 12'hfdc;
    stim[43] = 12'h989;
    stim[44] = 12'h803;
    stim[45] = 12'hab9;
    stim[46] = 12'h846;
    stim[47] = 12'hcce;
    stim[48] = 12'h85d;
    stim[49] = 12'hd72;
    stim[50] = 12'hdc4;
    stim[51] = 12'hee6;
    stim[52] = 12'h80b;
    stim[53] = 12'h961;
    stim[54] = 12'hfbe;
    stim[55] = 12'hcba;
    stim[56] = 12'ha0c;
    stim[57] = 12'hf42;
    stim[58] = 12'ha5d;
    stim[59] = 12'hf8b;
    stim[60] = 12'hf68;
    stim[61] = 12'h8f7;
    stim[62] = 12'he38;
    stim[63] = 12'hbd8;
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
      expv[1] = 46'hxxxxxxxxx000;
      expv[2] = 46'hxxxxxxxxx001;
      expv[3] = 46'hxxxxxxxxx001;
      expv[4] = 46'hxxxxxxxxx001;
      expv[5] = 46'hxxxxxxxxx001;
      expv[6] = 46'hxxxxxxxxx001;
      expv[7] = 46'hxxxxxxxxx001;
      expv[8] = 46'hxxxxxxx18002;
      expv[9] = 46'hxxxxxxx18001;
      expv[10] = 46'hxxxxxxx18001;
      expv[11] = 46'hxxxxxxx44002;
      expv[12] = 46'hxxxxxxx44001;
      expv[13] = 46'hxxxxxxx44001;
      expv[14] = 46'hxxxxxxxe0003;
      expv[15] = 46'hxxxxx36e0005;
      expv[16] = 46'hxxx2236e0006;
      expv[17] = 46'hxxx2236e0001;
      expv[18] = 46'hxxx2236ec002;
      expv[19] = 46'hxxx2236ec002;
      expv[20] = 46'hxxx2236ec000;
      expv[21] = 46'hxxx2236ec001;
      expv[22] = 46'hxxx2236ec001;
      expv[23] = 46'hxxx223624003;
      expv[24] = 46'hxxx234224004;
      expv[25] = 46'hxxx234224000;
      expv[26] = 46'hxxx234224001;
      expv[27] = 46'hxxx234224001;
      expv[28] = 46'hxxx2343ae003;
      expv[29] = 46'hxxx2343ae003;
      expv[30] = 46'hxxx2327ae004;
      expv[31] = 46'hxxx2327ae001;
      expv[32] = 46'hxxx232714003;
      expv[33] = 46'hxxx23e514005;
      expv[34] = 46'hxxx23e514005;
      expv[35] = 46'hxxx43e514006;
      expv[36] = 46'hxxx43e514006;
      expv[37] = 46'hxxx43e514001;
      expv[38] = 46'hxxx43e52c002;
      expv[39] = 46'hxxx43e52c001;
      expv[40] = 46'hxxx43e596003;
      expv[41] = 46'hxxx43e996005;
      expv[42] = 46'hxxx43e996005;
      expv[43] = 46'hxxxb9e996006;
      expv[44] = 46'hxxxb9e996006;
      expv[45] = 46'hxxxb9e996006;
      expv[46] = 46'hxxxb9e996006;
      expv[47] = 46'hxxxb9e996006;
      expv[48] = 46'hxxxb9e996001;
      expv[49] = 46'hxxxb9e996001;
      expv[50] = 46'hxxxb9e996001;
      expv[51] = 46'hxxxb9e996001;
      expv[52] = 46'hxxxb9e9cc003;
      expv[53] = 46'hxxxb9e9cc003;
      expv[54] = 46'hxxxb9e9cc003;
      expv[55] = 46'hxxxb97dcc004;
      expv[56] = 46'hxxxb97dcc001;
      expv[57] = 46'hxxxb97c18003;
      expv[58] = 46'hxxxb88418004;
      expv[59] = 46'hxxxb88418004;
      expv[60] = 46'hxxxb88418001;
      expv[61] = 46'hxxxb884d0002;
      expv[62] = 46'hxxxb884d0002;
      expv[63] = 46'hxxxb884d0001;
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

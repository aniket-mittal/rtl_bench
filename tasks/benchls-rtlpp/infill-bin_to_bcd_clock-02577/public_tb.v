// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02577 dut (
    .clk(clk),
    .rst_n(in_vec[30:30]),
    .hours(in_vec[29:22]),
    .minutes(in_vec[21:14]),
    .seconds(in_vec[13:6]),
    .sel_in(in_vec[5:0]),
    .hour(out_vec[29:22]),
    .minute(out_vec[21:14]),
    .second(out_vec[13:6]),
    .sel_out(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h38ea927c;
    stim[1] = 31'h17d0731a;
    stim[2] = 31'h567886ad;
    stim[3] = 31'h66d04aea;
    stim[4] = 31'h678202fa;
    stim[5] = 31'h563ba821;
    stim[6] = 31'h5fd706f0;
    stim[7] = 31'h5f1a4d18;
    stim[8] = 31'h4f1e043d;
    stim[9] = 31'h6076f576;
    stim[10] = 31'h4cc406d5;
    stim[11] = 31'h6f26152b;
    stim[12] = 31'h4bc9faa1;
    stim[13] = 31'h563e862f;
    stim[14] = 31'h5c72e1a2;
    stim[15] = 31'h790301e0;
    stim[16] = 31'h65920f71;
    stim[17] = 31'h5c18ce11;
    stim[18] = 31'h6c122fd9;
    stim[19] = 31'h48c8d615;
    stim[20] = 31'h6f453132;
    stim[21] = 31'h17f261d5;
    stim[22] = 31'h464f34e4;
    stim[23] = 31'h4d9dc8d2;
    stim[24] = 31'h7d0be279;
    stim[25] = 31'h72c5527f;
    stim[26] = 31'h7ab4fe45;
    stim[27] = 31'h57197629;
    stim[28] = 31'h66ff069d;
    stim[29] = 31'h73a26dba;
    stim[30] = 31'h7a8b1484;
    stim[31] = 31'h73756bde;
    stim[32] = 31'h7ae2bcae;
    stim[33] = 31'h4a0fdd3f;
    stim[34] = 31'h72c36237;
    stim[35] = 31'h79607861;
    stim[36] = 31'h7ffb64d9;
    stim[37] = 31'h5923a4fe;
    stim[38] = 31'h68fe7d23;
    stim[39] = 31'h58163f59;
    stim[40] = 31'h58e1deac;
    stim[41] = 31'h79c42ac2;
    stim[42] = 31'h40ccdc8c;
    stim[43] = 31'h6bce83dc;
    stim[44] = 31'h690a52e2;
    stim[45] = 31'h5312143a;
    stim[46] = 31'h4e0950cc;
    stim[47] = 31'h6bd390ba;
    stim[48] = 31'h7c085f9d;
    stim[49] = 31'h0c6ff8e3;
    stim[50] = 31'h41409b71;
    stim[51] = 31'h76922bc9;
    stim[52] = 31'h74153d0e;
    stim[53] = 31'h578eff3b;
    stim[54] = 31'h7111482c;
    stim[55] = 31'h410de3cf;
    stim[56] = 31'h71bff974;
    stim[57] = 31'h6372a372;
    stim[58] = 31'h4f46acf4;
    stim[59] = 31'h4ee1f4d3;
    stim[60] = 31'h7db900b5;
    stim[61] = 31'h5497cd36;
    stim[62] = 31'h701f9ebe;
    stim[63] = 31'h73dd440d;
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
      expv[0] = 30'h0555cd00;
      expv[1] = 30'h0555cd00;
      expv[2] = 30'h0555cd00;
      expv[3] = 30'h0a0d0a6d;
      expv[4] = 30'h0a8050ea;
      expv[5] = 30'h0c02c47a;
      expv[6] = 30'h09124ca1;
      expv[7] = 30'h0c4acab0;
      expv[8] = 30'h0ad05498;
      expv[9] = 30'h0ad6467d;
      expv[10] = 30'h004a8876;
      expv[11] = 30'h07064a95;
      expv[12] = 30'h0ac9082b;
      expv[13] = 30'h060f10a1;
      expv[14] = 30'h0916c92f;
      expv[15] = 30'h06844262;
      expv[16] = 30'h010482a0;
      expv[17] = 30'h0882d871;
      expv[18] = 30'h064e1651;
      expv[19] = 30'h0642d8d9;
      expv[20] = 30'h00ce0915;
      expv[21] = 30'h0555cd00;
      expv[22] = 30'h0555cd00;
      expv[23] = 30'h0a180724;
      expv[24] = 30'h08960e12;
      expv[25] = 30'h08128339;
      expv[26] = 30'h0448433f;
      expv[27] = 30'h04071685;
      expv[28] = 30'h0ace8929;
      expv[29] = 30'h0a980a5d;
      expv[30] = 30'h0503153a;
      expv[31] = 30'h041106c4;
      expv[32] = 30'h04c8529e;
      expv[33] = 30'h0444142e;
      expv[34] = 30'h02d8d4bf;
      expv[35] = 30'h0444c2f7;
      expv[36] = 30'h02004ce1;
      expv[37] = 30'h0c520719;
      expv[38] = 30'h0105073e;
      expv[39] = 30'h00d694a3;
      expv[40] = 30'h00091859;
      expv[41] = 30'h00c296ec;
      expv[42] = 30'h028650c2;
      expv[43] = 30'h00d4540c;
      expv[44] = 30'h0616c61c;
      expv[45] = 30'h01104462;
      expv[46] = 30'h0482c67a;
      expv[47] = 30'h090e80cc;
      expv[48] = 30'h060500ba;
      expv[49] = 30'h0555cd00;
      expv[50] = 30'h0555cd00;
      expv[51] = 30'h02009231;
      expv[52] = 30'h0a42d289;
      expv[53] = 30'h0648148e;
      expv[54] = 30'h0c17183b;
      expv[55] = 30'h01020cac;
      expv[56] = 30'h0116060f;
      expv[57] = 30'h0258ceb4;
      expv[58] = 30'h04c404f2;
      expv[59] = 30'h0b0a5474;
      expv[60] = 30'h0a828713;
      expv[61] = 30'h088e40b5;
      expv[62] = 30'h06cc54b6;
      expv[63] = 30'h001896fe;
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

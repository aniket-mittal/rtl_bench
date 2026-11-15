// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_000642 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h13e591a62;
    stim[1] = 33'h1bdd427c7;
    stim[2] = 33'h036491a52;
    stim[3] = 33'h03c4f421b;
    stim[4] = 33'h0561c49d9;
    stim[5] = 33'h07a618764;
    stim[6] = 33'h0d7b48449;
    stim[7] = 33'h1785a6884;
    stim[8] = 33'h016df4e2c;
    stim[9] = 33'h03aa77f2d;
    stim[10] = 33'h07a57f664;
    stim[11] = 33'h04926f759;
    stim[12] = 33'h08f83024d;
    stim[13] = 33'h0f8326b82;
    stim[14] = 33'h05469df5a;
    stim[15] = 33'h0f56d8abd;
    stim[16] = 33'h046ddf068;
    stim[17] = 33'h0660fa880;
    stim[18] = 33'h1da0b4bf7;
    stim[19] = 33'h0f9928adc;
    stim[20] = 33'h080fde70f;
    stim[21] = 33'h0f8e16796;
    stim[22] = 33'h092c0cedd;
    stim[23] = 33'h02e12ebd1;
    stim[24] = 33'h0a50e0ab4;
    stim[25] = 33'h0543750e1;
    stim[26] = 33'h091af51c9;
    stim[27] = 33'h016a0450d;
    stim[28] = 33'h001d75035;
    stim[29] = 33'h0d5fda019;
    stim[30] = 33'h0a6aee96b;
    stim[31] = 33'h151c97ecb;
    stim[32] = 33'h10d47c86c;
    stim[33] = 33'h0c107299a;
    stim[34] = 33'h0001be10a;
    stim[35] = 33'h040ac1ea3;
    stim[36] = 33'h078d58fb5;
    stim[37] = 33'h0c7998bc8;
    stim[38] = 33'h0f4a7e7a2;
    stim[39] = 33'h0b842a057;
    stim[40] = 33'h01b06cbeb;
    stim[41] = 33'h0ea0664b9;
    stim[42] = 33'h0610ac3e4;
    stim[43] = 33'h068536f9f;
    stim[44] = 33'h037987b39;
    stim[45] = 33'h011a373c0;
    stim[46] = 33'h0f79aaa77;
    stim[47] = 33'h0f3a4ef46;
    stim[48] = 33'h0c9e5c498;
    stim[49] = 33'h0cdbeb83f;
    stim[50] = 33'h0a0352867;
    stim[51] = 33'h0ba3271a4;
    stim[52] = 33'h007766d44;
    stim[53] = 33'h0ef5f63d6;
    stim[54] = 33'h0835819cc;
    stim[55] = 33'h01ad3fcc4;
    stim[56] = 33'h011f08d1e;
    stim[57] = 33'h1a9fe5a03;
    stim[58] = 33'h026116b03;
    stim[59] = 33'h064cab4e9;
    stim[60] = 33'h07ca4c27e;
    stim[61] = 33'h087a650e0;
    stim[62] = 33'h050eaad20;
    stim[63] = 33'h0a6152212;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxxc7;
      expv[3] = 74'h00000000xxxxxxxxx52;
      expv[4] = 74'h00000000xxxxxxxxx52;
      expv[5] = 74'hxxxxxxxxxxxxxxxxx52;
      expv[6] = 74'h00000000xxxxxxxxx52;
      expv[7] = 74'h00000000xxxxxxxxx52;
      expv[8] = 74'h00000000xxxxxxxxx84;
      expv[9] = 74'h00000000xxxxxxxxx2c;
      expv[10] = 74'h00000000xxxxxxxxx2c;
      expv[11] = 74'hxxxxxxxxxxxxxxxxx2c;
      expv[12] = 74'h00000000xxxxxxxxx2c;
      expv[13] = 74'h00000000xxxxxxxxx2c;
      expv[14] = 74'h00000000xxxxxxxxx82;
      expv[15] = 74'h00000000xxxxxxxxx82;
      expv[16] = 74'hxxxxxxxxxxxxxxxxx82;
      expv[17] = 74'h00000000xxxxxxxxx82;
      expv[18] = 74'h00000000xxxxxxxxx82;
      expv[19] = 74'h00000000xxxxxxxxxf7;
      expv[20] = 74'h00000000xxxxxxxxxdc;
      expv[21] = 74'h00000000xxxxxxxxxdc;
      expv[22] = 74'hxxxxxxxxxxxxxxxxxdc;
      expv[23] = 74'h00000000xxxxxxxxxdc;
      expv[24] = 74'h00000000xxxxxxxxxdc;
      expv[25] = 74'h00000000xxxxxxxxxb4;
      expv[26] = 74'h00000000xxxxxxxxxb4;
      expv[27] = 74'hxxxxxxxxxxxxxxxxxb4;
      expv[28] = 74'h00000000xxxxxxxxxb4;
      expv[29] = 74'h00000000xxxxxxxxxb4;
      expv[30] = 74'h00000000xxxxxxxxx19;
      expv[31] = 74'h00000000xxxxxxxxx19;
      expv[32] = 74'h00000000xxxxxxxxx19;
      expv[33] = 74'h00000000xxxxxxxxx6c;
      expv[34] = 74'h00000000xxxxxxxxx9a;
      expv[35] = 74'h00000000xxxxxxxxx9a;
      expv[36] = 74'hxxxxxxxxxxxxxxxxx9a;
      expv[37] = 74'h00000000xxxxxxxxx9a;
      expv[38] = 74'h00000000xxxxxxxxx9a;
      expv[39] = 74'h00000000xxxxxxxxxa2;
      expv[40] = 74'h00000000xxxxxxxxxa2;
      expv[41] = 74'hxxxxxxxxxxxxxxxxxa2;
      expv[42] = 74'h00000000xxxxxxxxxa2;
      expv[43] = 74'h00000000xxxxxxxxxa2;
      expv[44] = 74'h00000000xxxxxxxxx9f;
      expv[45] = 74'h00000000xxxxxxxxx9f;
      expv[46] = 74'hxxxxxxxxxxxxxxxxx9f;
      expv[47] = 74'h00000000xxxxxxxxx9f;
      expv[48] = 74'h00000000xxxxxxxxx9f;
      expv[49] = 74'h00000000xxxxxxxxx98;
      expv[50] = 74'h00000000xxxxxxxxx98;
      expv[51] = 74'hxxxxxxxxxxxxxxxxx98;
      expv[52] = 74'h00000000xxxxxxxxx98;
      expv[53] = 74'h00000001xxxxxxxxx98;
      expv[54] = 74'h00000000xxxxxxxxxd6;
      expv[55] = 74'h00000000xxxxxxxxxd6;
      expv[56] = 74'hxxxxxxxxxxxxxxxxxd6;
      expv[57] = 74'h00000000xxxxxxxxxd6;
      expv[58] = 74'h00000000xxxxxxxxxd6;
      expv[59] = 74'h00000000xxxxxxxxx03;
      expv[60] = 74'h00000000xxxxxxxxx03;
      expv[61] = 74'hxxxxxxxxxxxxxxxxx03;
      expv[62] = 74'h00000000xxxxxxxxx03;
      expv[63] = 74'h00000000xxxxxxxxx03;
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

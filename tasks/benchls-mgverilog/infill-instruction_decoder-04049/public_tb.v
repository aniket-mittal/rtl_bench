// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04049 dut (
    .insn(in_vec[31:0]),
    .idxZ(out_vec[53:50]),
    .idxX(out_vec[49:46]),
    .idxY(out_vec[45:42]),
    .valI(out_vec[41:10]),
    .op(out_vec[9:6]),
    .kind(out_vec[5:4]),
    .storing(out_vec[3:3]),
    .loading(out_vec[2:2]),
    .deref_rhs(out_vec[1:1]),
    .branching(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hf6988647;
    stim[1] = 32'h482e5099;
    stim[2] = 32'h710dc4cf;
    stim[3] = 32'h3d034d4a;
    stim[4] = 32'ha3bb1976;
    stim[5] = 32'h56a026e2;
    stim[6] = 32'h0bd9c0b8;
    stim[7] = 32'h1d80aa8c;
    stim[8] = 32'h890eb3d6;
    stim[9] = 32'h6158c8b6;
    stim[10] = 32'heb353e31;
    stim[11] = 32'h297a109a;
    stim[12] = 32'h8bfc049d;
    stim[13] = 32'h256dc621;
    stim[14] = 32'he5c7501a;
    stim[15] = 32'h2ffec75a;
    stim[16] = 32'h9c948720;
    stim[17] = 32'hfecfb97e;
    stim[18] = 32'hd0b89e6b;
    stim[19] = 32'hdd5a1473;
    stim[20] = 32'h86c2091e;
    stim[21] = 32'h1bf14621;
    stim[22] = 32'h89db5826;
    stim[23] = 32'h045d60b5;
    stim[24] = 32'h8d7b0ce5;
    stim[25] = 32'hfbca95a0;
    stim[26] = 32'hdbc50b8f;
    stim[27] = 32'h5e599e6b;
    stim[28] = 32'hf19793bb;
    stim[29] = 32'hfc2cb25c;
    stim[30] = 32'hb12d0eae;
    stim[31] = 32'h112f6160;
    stim[32] = 32'h3a96462f;
    stim[33] = 32'hc6551da7;
    stim[34] = 32'he3e9e23a;
    stim[35] = 32'h3e7d2911;
    stim[36] = 32'h1cfba51a;
    stim[37] = 32'h9ab09536;
    stim[38] = 32'hb07d28e1;
    stim[39] = 32'hec1c3e5a;
    stim[40] = 32'h843e5ec0;
    stim[41] = 32'h7cadd917;
    stim[42] = 32'h1d6f254e;
    stim[43] = 32'h28376c79;
    stim[44] = 32'h9a693b72;
    stim[45] = 32'h3a57a799;
    stim[46] = 32'hb1d3e602;
    stim[47] = 32'h261d2437;
    stim[48] = 32'hd943df85;
    stim[49] = 32'h1b6d9704;
    stim[50] = 32'h15b8590b;
    stim[51] = 32'hc36b2081;
    stim[52] = 32'h0473c31b;
    stim[53] = 32'hccdc63b6;
    stim[54] = 32'h22f926d1;
    stim[55] = 32'heb6f1637;
    stim[56] = 32'hc6341556;
    stim[57] = 32'hec2589b7;
    stim[58] = 32'hfd2613a4;
    stim[59] = 32'h7b94e505;
    stim[60] = 32'hdc32baf4;
    stim[61] = 32'h6722bb89;
    stim[62] = 32'hb1fc58b8;
    stim[63] = 32'h7240da19;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 54'h1a43ffe2191c36;
      expv[1] = 54'h20b80000026550;
      expv[2] = 54'h04340000133f16;
      expv[3] = 54'h340ffffff52906;
      expv[4] = 54'h0eefffffe5d868;
      expv[5] = 54'h1a8000001b889a;
      expv[6] = 54'h2f64000002e300;
      expv[7] = 54'h3603ffffea328a;
      expv[8] = 54'h243800000f5ae0;
      expv[9] = 54'h0563ffffe2db18;
      expv[10] = 54'h2cc00014f8c438;
      expv[11] = 54'h25e80000026848;
      expv[12] = 54'h2ff00000127420;
      expv[13] = 54'h15b40000188708;
      expv[14] = 54'h1700001d406838;
      expv[15] = 54'h3ff800001d6b08;
      expv[16] = 54'h325000001c822a;
      expv[17] = 54'h3b03fffee5f836;
      expv[18] = 54'h02c3ffe279ac3a;
      expv[19] = 54'h3543ffe851cc3a;
      expv[20] = 54'h1b0bffffe47820;
      expv[21] = 54'h2fc4000018850a;
      expv[22] = 54'h276fffffe09960;
      expv[23] = 54'h1174000002d580;
      expv[24] = 54'h35effffff39420;
      expv[25] = 54'h2f03ffea568036;
      expv[26] = 54'h2f0000142e3c3a;
      expv[27] = 54'h3967fffff9ae5a;
      expv[28] = 54'h0640001e4eec36;
      expv[29] = 54'h3083fff2c97036;
      expv[30] = 54'h04b7fffffab826;
      expv[31] = 54'h04bc000005818a;
      expv[32] = 54'h2a58000018bd06;
      expv[33] = 54'h19400014769c30;
      expv[34] = 54'h0f83ffe788e838;
      expv[35] = 54'h39f7ffffe44486;
      expv[36] = 54'h33ec0000146a8a;
      expv[37] = 54'h2ac0000014da6a;
      expv[38] = 54'h01f7ffffe384a6;
      expv[39] = 54'h3043fff0f96838;
      expv[40] = 54'h10fbfffffb0160;
      expv[41] = 54'h32b7ffffe45f56;
      expv[42] = 54'h35bc000015388a;
      expv[43] = 54'h20dffffff1e588;
      expv[44] = 54'h29a7ffffedc8ea;
      expv[45] = 54'h295c00001e6686;
      expv[46] = 54'h074c0000180ba6;
      expv[47] = 54'h1874000010dc88;
      expv[48] = 54'h2500000f7e143a;
      expv[49] = 54'h2db400001c124a;
      expv[50] = 54'h16e3ffffe42d4a;
      expv[51] = 54'h0d83ffec820430;
      expv[52] = 54'h11cc00000c6f00;
      expv[53] = 54'h3343fff18ed830;
      expv[54] = 54'h0be400001b4488;
      expv[55] = 54'h2d83fffc58dc38;
      expv[56] = 54'h18c00010555830;
      expv[57] = 54'h3080001626dc38;
      expv[58] = 54'h348000184e9036;
      expv[59] = 54'h2e500000141796;
      expv[60] = 54'h30c0000aebd03a;
      expv[61] = 54'h1c8bffffee26d8;
      expv[62] = 54'h07f3ffffe2e166;
      expv[63] = 54'h0903ffffe86756;
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

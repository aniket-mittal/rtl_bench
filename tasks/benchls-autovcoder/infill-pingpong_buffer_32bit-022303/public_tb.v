// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022303 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h6303207c8;
    stim[1] = 35'h47f533cba;
    stim[2] = 35'h0f05f398a;
    stim[3] = 35'h11b4db21c;
    stim[4] = 35'h1f4e199fc;
    stim[5] = 35'h125bb5fa7;
    stim[6] = 35'h381377505;
    stim[7] = 35'h345f424aa;
    stim[8] = 35'h35979038d;
    stim[9] = 35'h15a32692b;
    stim[10] = 35'h23a3a6919;
    stim[11] = 35'h0cf31c089;
    stim[12] = 35'h15fb31e17;
    stim[13] = 35'h66858b2b5;
    stim[14] = 35'h76d33542a;
    stim[15] = 35'h34840a1f8;
    stim[16] = 35'h0f36a8739;
    stim[17] = 35'h04e2491a9;
    stim[18] = 35'h11fa9bafe;
    stim[19] = 35'h3f3855c5a;
    stim[20] = 35'h39ed8c4a4;
    stim[21] = 35'h068c01d0c;
    stim[22] = 35'h2edac398e;
    stim[23] = 35'h0e53effa0;
    stim[24] = 35'h24411c4c5;
    stim[25] = 35'h197f76d43;
    stim[26] = 35'h2d7ef5cf6;
    stim[27] = 35'h13fc94fe2;
    stim[28] = 35'h15a530e39;
    stim[29] = 35'h28cb7c709;
    stim[30] = 35'h0e3903927;
    stim[31] = 35'h02fcad617;
    stim[32] = 35'h22d7fe3db;
    stim[33] = 35'h0ea2441a5;
    stim[34] = 35'h3d7c042a2;
    stim[35] = 35'h25dacc999;
    stim[36] = 35'h30e62cf55;
    stim[37] = 35'h14447b2e8;
    stim[38] = 35'h1cc557e5d;
    stim[39] = 35'h103cb8d2a;
    stim[40] = 35'h2c8082606;
    stim[41] = 35'h19d5f77f3;
    stim[42] = 35'h1f85a8761;
    stim[43] = 35'h081443a56;
    stim[44] = 35'h016f44e41;
    stim[45] = 35'h64e58ece2;
    stim[46] = 35'h277a0256d;
    stim[47] = 35'h0b492edad;
    stim[48] = 35'h26e18f8ed;
    stim[49] = 35'h334fe1ee4;
    stim[50] = 35'h2249917e9;
    stim[51] = 35'h04b646cca;
    stim[52] = 35'h17c0b6c59;
    stim[53] = 35'h02ae64d6c;
    stim[54] = 35'h073bec028;
    stim[55] = 35'h2fb9e4022;
    stim[56] = 35'h20eb4e5c2;
    stim[57] = 35'h262fcca91;
    stim[58] = 35'h3287d6f39;
    stim[59] = 35'h009d24192;
    stim[60] = 35'h35ea63f03;
    stim[61] = 35'h231412134;
    stim[62] = 35'h213a93830;
    stim[63] = 35'h08a2f75de;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h07f533cb8;
      expv[3] = 35'h4f05f3988;
      expv[4] = 35'h51b4db21c;
      expv[5] = 35'h5f4e199fc;
      expv[6] = 35'h525bb5fa6;
      expv[7] = 35'h781377504;
      expv[8] = 35'h745f424aa;
      expv[9] = 35'h75979038c;
      expv[10] = 35'h55a32692a;
      expv[11] = 35'h63a3a6918;
      expv[12] = 35'h4cf31c088;
      expv[13] = 35'h55fb31e16;
      expv[14] = 35'h26858b2b4;
      expv[15] = 35'h36d335428;
      expv[16] = 35'h74840a1f8;
      expv[17] = 35'h4f36a8738;
      expv[18] = 35'h44e2491a8;
      expv[19] = 35'h51fa9baff;
      expv[20] = 35'h11fa9baff;
      expv[21] = 35'h11fa9baff;
      expv[22] = 35'h11fa9baff;
      expv[23] = 35'h11fa9baff;
      expv[24] = 35'h11fa9baff;
      expv[25] = 35'h7f3855c5a;
      expv[26] = 35'h597f76d43;
      expv[27] = 35'h197f76d43;
      expv[28] = 35'h197f76d43;
      expv[29] = 35'h6d7ef5cf6;
      expv[30] = 35'h68cb7c708;
      expv[31] = 35'h4e3903926;
      expv[32] = 35'h42fcad616;
      expv[33] = 35'h62d7fe3da;
      expv[34] = 35'h4ea2441a4;
      expv[35] = 35'h7d7c042a2;
      expv[36] = 35'h65dacc998;
      expv[37] = 35'h70e62cf54;
      expv[38] = 35'h54447b2e8;
      expv[39] = 35'h5cc557e5c;
      expv[40] = 35'h503cb8d2b;
      expv[41] = 35'h103cb8d2b;
      expv[42] = 35'h6c8082606;
      expv[43] = 35'h5f85a8760;
      expv[44] = 35'h481443a56;
      expv[45] = 35'h416f44e40;
      expv[46] = 35'h081443a54;
      expv[47] = 35'h677a0256c;
      expv[48] = 35'h4b492edac;
      expv[49] = 35'h66e18f8ec;
      expv[50] = 35'h734fe1ee4;
      expv[51] = 35'h6249917e8;
      expv[52] = 35'h44b646cca;
      expv[53] = 35'h57c0b6c58;
      expv[54] = 35'h42ae64d6c;
      expv[55] = 35'h473bec028;
      expv[56] = 35'h6fb9e4023;
      expv[57] = 35'h2fb9e4023;
      expv[58] = 35'h60eb4e5c2;
      expv[59] = 35'h7287d6f38;
      expv[60] = 35'h409d24192;
      expv[61] = 35'h75ea63f03;
      expv[62] = 35'h75ea63f03;
      expv[63] = 35'h75ea63f03;
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

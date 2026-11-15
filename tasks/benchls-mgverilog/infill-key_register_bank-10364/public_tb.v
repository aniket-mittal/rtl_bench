// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 112;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10364 dut (
    .clk_i(clk),
    .reset_i(in_vec[40:40]),
    .addr_i(in_vec[39:34]),
    .write_i(in_vec[33:33]),
    .read_i(in_vec[32:32]),
    .data_i(in_vec[31:0]),
    .data_o(out_vec[111:80]),
    .keys(out_vec[79:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h130109f2c3c;
    stim[1] = 41'h1ba928d24e0;
    stim[2] = 41'h0a75cc6d596;
    stim[3] = 41'h0743507f490;
    stim[4] = 41'h0b762ac872e;
    stim[5] = 41'h03a98874de0;
    stim[6] = 41'h06ef5e4869b;
    stim[7] = 41'h0f13e9afa93;
    stim[8] = 41'h0d23801a085;
    stim[9] = 41'h0c9be89e36f;
    stim[10] = 41'h0c69fd89bb4;
    stim[11] = 41'h0769bb3775d;
    stim[12] = 41'h0615d9f7148;
    stim[13] = 41'h029d0c5c668;
    stim[14] = 41'h098325289d2;
    stim[15] = 41'h0a0b5099a4f;
    stim[16] = 41'h03384defeeb;
    stim[17] = 41'h074bf18ddb1;
    stim[18] = 41'h073c46e49e5;
    stim[19] = 41'h06e564aa377;
    stim[20] = 41'h044cca5a621;
    stim[21] = 41'h025fcc3b553;
    stim[22] = 41'h081f74ff687;
    stim[23] = 41'h08475d2088b;
    stim[24] = 41'h0cf698d4d09;
    stim[25] = 41'h0125cfa3e56;
    stim[26] = 41'h0ef8de90635;
    stim[27] = 41'h0d0184aac05;
    stim[28] = 41'h0f6631939ad;
    stim[29] = 41'h011fcd29aa3;
    stim[30] = 41'h0d38dce9aaf;
    stim[31] = 41'h086850352fb;
    stim[32] = 41'h09dff0f0d56;
    stim[33] = 41'h0c0a34710c9;
    stim[34] = 41'h01cb0be69b6;
    stim[35] = 41'h023787cbd70;
    stim[36] = 41'h0492ef48ff7;
    stim[37] = 41'h0fb9a4cced1;
    stim[38] = 41'h1f6e881d2e4;
    stim[39] = 41'h0dca44a8f54;
    stim[40] = 41'h099e5bea889;
    stim[41] = 41'h0d8d4049273;
    stim[42] = 41'h0ec30318c2b;
    stim[43] = 41'h06ebaf1958d;
    stim[44] = 41'h0f1a5c2322f;
    stim[45] = 41'h035a01d3f16;
    stim[46] = 41'h023ec9d9a87;
    stim[47] = 41'h06a081ecde5;
    stim[48] = 41'h04975f5ca69;
    stim[49] = 41'h05d96578a2b;
    stim[50] = 41'h0b77035c960;
    stim[51] = 41'h0b2b8612497;
    stim[52] = 41'h0c2bfe242e6;
    stim[53] = 41'h03a681c2474;
    stim[54] = 41'h0cd3c7fdc1a;
    stim[55] = 41'h07239c474a6;
    stim[56] = 41'h099d0213464;
    stim[57] = 41'h04f66ff5b34;
    stim[58] = 41'h0bb100971b5;
    stim[59] = 41'h044409c78aa;
    stim[60] = 41'h0fa9bcd5d2f;
    stim[61] = 41'h09b54e647d9;
    stim[62] = 41'h01d3e1b8a71;
    stim[63] = 41'h0154c568626;
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
      expv[0] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[1] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[2] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[3] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[4] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[5] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[6] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[7] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[8] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[9] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[10] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[11] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[12] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[13] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[14] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[15] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[16] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[17] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[18] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[19] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[20] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[21] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[22] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[23] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[24] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[25] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[26] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[27] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[28] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[29] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[30] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[31] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[32] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[33] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[34] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[35] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[36] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[37] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[38] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[39] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[40] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[41] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[42] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[43] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[44] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[45] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[46] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[47] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[48] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[49] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[50] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[51] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[52] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[53] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[54] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[55] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[56] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[57] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[58] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[59] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[60] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[61] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[62] = 112'hxxxxxxxx0000ffffffffffffffff;
      expv[63] = 112'hxxxxxxxx0000ffffffffffffffff;
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

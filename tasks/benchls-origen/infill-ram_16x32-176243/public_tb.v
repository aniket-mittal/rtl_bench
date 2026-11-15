// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_176243 dut (
    .clk(clk),
    .rst_n(in_vec[66:66]),
    .MemRead(in_vec[65:65]),
    .MemWrite(in_vec[64:64]),
    .address(in_vec[63:32]),
    .write_data(in_vec[31:0]),
    .read_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h1c3ee5cb6e7553ebd;
    stim[1] = 67'h18e4384944aca8ada;
    stim[2] = 67'h64167872604862fe2;
    stim[3] = 67'h464d5194f75419733;
    stim[4] = 67'h5a4a470b12e4d8038;
    stim[5] = 67'h7ce340580ae5e7bf5;
    stim[6] = 67'h6b3194a1a34410c2c;
    stim[7] = 67'h541dfa4e00876c64c;
    stim[8] = 67'h68bfb2406ed0fb971;
    stim[9] = 67'h51570861b8faec2ad;
    stim[10] = 67'h77f66e3c8e8e98f53;
    stim[11] = 67'h4bbbb9d7a0c666a7e;
    stim[12] = 67'h538a33d9d983767d7;
    stim[13] = 67'h4b9ef626d93179ca1;
    stim[14] = 67'h6dbe3b45166444793;
    stim[15] = 67'h75e607f5558e71204;
    stim[16] = 67'h4379c95c00a1adf34;
    stim[17] = 67'h5eb3f2f64dcc30cd2;
    stim[18] = 67'h7b8cf6311bdc8e05c;
    stim[19] = 67'h64dd760fcf98d44dc;
    stim[20] = 67'h6c64c952b0a5fbcdf;
    stim[21] = 67'h547a337d2c7a242ac;
    stim[22] = 67'h6c6abeb38af008b63;
    stim[23] = 67'h40f9d6155210a2732;
    stim[24] = 67'h6de17174f640f223b;
    stim[25] = 67'h64dc4cb2b714ad796;
    stim[26] = 67'h412e42172e8f89e64;
    stim[27] = 67'h1788a6deaccb0b996;
    stim[28] = 67'h6b44468fcccc2775e;
    stim[29] = 67'h57903c4f849fbd154;
    stim[30] = 67'h4da2a66711d105307;
    stim[31] = 67'h5253b8b3e0e744f93;
    stim[32] = 67'h7b79f23437456ddee;
    stim[33] = 67'h626243f1f3f985908;
    stim[34] = 67'h647b9ddadef35eeb8;
    stim[35] = 67'h44dfdf3ca3f94b35d;
    stim[36] = 67'h425b250249a53ebda;
    stim[37] = 67'h54c65a939079e3aa9;
    stim[38] = 67'h6af39e1252b3d8545;
    stim[39] = 67'h6cd591368e694a6d6;
    stim[40] = 67'h5c71076c0e80484b6;
    stim[41] = 67'h79e1583531daab4ab;
    stim[42] = 67'h598e4b0621a290af1;
    stim[43] = 67'h58df35e73e4139eb0;
    stim[44] = 67'h416faff7d89061254;
    stim[45] = 67'h495c9565de9906934;
    stim[46] = 67'h6ad423fc3d9de0ab0;
    stim[47] = 67'h4197373152163593c;
    stim[48] = 67'h6a31f157682fb6e96;
    stim[49] = 67'h652e2530d8e235936;
    stim[50] = 67'h45f6d4692b2488c7e;
    stim[51] = 67'h7fafba5ccc495396e;
    stim[52] = 67'h631dbe4b3705b01d2;
    stim[53] = 67'h6706093c165912877;
    stim[54] = 67'h74dcf91e9fe98b173;
    stim[55] = 67'h75a58853a04bcf2df;
    stim[56] = 67'h628f4479dee9a2b71;
    stim[57] = 67'h50ed7af6b486938fa;
    stim[58] = 67'h6b6c3b8c49d7f338d;
    stim[59] = 67'h764e2e2c263e3e2ee;
    stim[60] = 67'h7bf3b969c8c2faaec;
    stim[61] = 67'h7bacbc7b7e66763d6;
    stim[62] = 67'h7365afbcfd6a92a5a;
    stim[63] = 67'h7898e9a05b8434dcc;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000006;
      expv[4] = 32'h00000006;
      expv[5] = 32'h00000006;
      expv[6] = 32'h00000000;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'h00000006;
      expv[10] = 32'h00000006;
      expv[11] = 32'h00000008;
      expv[12] = 32'h00000008;
      expv[13] = 32'h00000008;
      expv[14] = 32'h00000008;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'h0000000b;
      expv[22] = 32'h0000000b;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'h0000000f;
      expv[26] = 32'h0000000b;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'h00000003;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'h0000000d;
      expv[36] = 32'h0000000d;
      expv[37] = 32'h0000000d;
      expv[38] = 32'h0000000d;
      expv[39] = 32'h00000005;
      expv[40] = 32'he8e98f53;
      expv[41] = 32'he8e98f53;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'h7456ddee;
      expv[48] = 32'h7456ddee;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'h0000000d;
      expv[51] = 32'h0000000d;
      expv[52] = 32'h0000000c;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'h00000001;
      expv[55] = 32'h00000009;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hdcc30cd2;
      expv[60] = 32'h1a290af1;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'h0000000f;
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

// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02045 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h3c7053d664af3434af;
    stim[1] = 70'h3d7d4effcda883df6c;
    stim[2] = 70'h1e4082d7003d0aba1b;
    stim[3] = 70'h1f403c0380f76c78e5;
    stim[4] = 70'h15c3b1de50b4c2eed8;
    stim[5] = 70'h06a7654b6112092182;
    stim[6] = 70'h163ba0804b502553d2;
    stim[7] = 70'h0ee521f83cee0048d5;
    stim[8] = 70'h113f82dccc41206e7e;
    stim[9] = 70'h02718e2974746b2dd4;
    stim[10] = 70'h1d8b3ac7bde9d5a3cd;
    stim[11] = 70'h0673d7f31cfd2faf5d;
    stim[12] = 70'h1184103388b542ebdb;
    stim[13] = 70'h1ad5abf07b0ff08624;
    stim[14] = 70'h1cc6fd06fbefc4569e;
    stim[15] = 70'h3c6b4abd017c7ea2ed;
    stim[16] = 70'h12d96c54f4cb04bddf;
    stim[17] = 70'h1bd5ae53e6a238de4c;
    stim[18] = 70'h0b0a6f21529e45f931;
    stim[19] = 70'h19beec6417ed997656;
    stim[20] = 70'h078d5f53e854de72d4;
    stim[21] = 70'h1df33005e330136848;
    stim[22] = 70'h0e2f88358cf0cbb4e0;
    stim[23] = 70'h00b749fe7d7b00dfc4;
    stim[24] = 70'h0dda112f4871f290ca;
    stim[25] = 70'h0b56964fb4966c727c;
    stim[26] = 70'h171496ff0ca471b24e;
    stim[27] = 70'h1461d09330d357e965;
    stim[28] = 70'h081af41e34b63b34df;
    stim[29] = 70'h0035a77bbf99518a62;
    stim[30] = 70'h15001dc8b1dc29699e;
    stim[31] = 70'h04b0d0ea601b67e090;
    stim[32] = 70'h163919612001bf03eb;
    stim[33] = 70'h026e4c1e7df6b26288;
    stim[34] = 70'h1ffdbbb91f6d7eef88;
    stim[35] = 70'h1b843a1a43dc0886d4;
    stim[36] = 70'h0010b3f8992dfcff11;
    stim[37] = 70'h132d72f1b23905af57;
    stim[38] = 70'h0fd20bcba37b9c9213;
    stim[39] = 70'h0e58434f52f3d9519e;
    stim[40] = 70'h1eb70bbe0f95b94fd9;
    stim[41] = 70'h083ca1dee445cf9286;
    stim[42] = 70'h013e474e40fde2dee2;
    stim[43] = 70'h1239ac26c7518bb4c6;
    stim[44] = 70'h3a3402958203c44606;
    stim[45] = 70'h1204888464ca8870ba;
    stim[46] = 70'h17987ad680a0e1cd46;
    stim[47] = 70'h1ee0a2a2b682a9dbe4;
    stim[48] = 70'h1755eb3909313a526e;
    stim[49] = 70'h086376dbe7ac083ec7;
    stim[50] = 70'h0bec3f84f4e88f517f;
    stim[51] = 70'h1b8d9f829b0963b606;
    stim[52] = 70'h181b5a69fd0ca7faa6;
    stim[53] = 70'h110bfaa351fe0812a2;
    stim[54] = 70'h02a77f9f0c75a01681;
    stim[55] = 70'h1a114616fd93532ec0;
    stim[56] = 70'h18956d3e487e418989;
    stim[57] = 70'h0d22ed7e4e39aac3ec;
    stim[58] = 70'h04dd49c18c35bfe491;
    stim[59] = 70'h06f7c9209117cf73ba;
    stim[60] = 70'h170df754698854ff40;
    stim[61] = 70'h07c8f29d43af0592a3;
    stim[62] = 70'h1ca2f37a4b05c79258;
    stim[63] = 70'h0e8d47f6d9876a8d28;
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
      expv[0] = 33'h0af3434ae;
      expv[1] = 33'h1a883df6c;
      expv[2] = 33'h03d0aba1a;
      expv[3] = 33'h0f76c78e4;
      expv[4] = 33'h0b4c2eed9;
      expv[5] = 33'h112092182;
      expv[6] = 33'h1502553d2;
      expv[7] = 33'h0ee0048d4;
      expv[8] = 33'h041206e7e;
      expv[9] = 33'h0746b2dd4;
      expv[10] = 33'h1e9d5a3cc;
      expv[11] = 33'h0fd2faf5c;
      expv[12] = 33'h0b542ebda;
      expv[13] = 33'h10ff08624;
      expv[14] = 33'h1efc4569e;
      expv[15] = 33'h17c7ea2ec;
      expv[16] = 33'h0cb04bdde;
      expv[17] = 33'h0a238de4c;
      expv[18] = 33'h09e45f930;
      expv[19] = 33'h1ed997656;
      expv[20] = 33'h054de72d4;
      expv[21] = 33'h130136848;
      expv[22] = 33'h0f0cbb4e0;
      expv[23] = 33'h17b00dfc4;
      expv[24] = 33'h071f290ca;
      expv[25] = 33'h0966c727c;
      expv[26] = 33'h0a471b24e;
      expv[27] = 33'h0d357e964;
      expv[28] = 33'h0b63b34de;
      expv[29] = 33'h199518a62;
      expv[30] = 33'h1dc29699f;
      expv[31] = 33'h01b67e090;
      expv[32] = 33'h001bf03ea;
      expv[33] = 33'h1f6b26288;
      expv[34] = 33'h16d7eef88;
      expv[35] = 33'h1dc0886d4;
      expv[36] = 33'h12dfcff10;
      expv[37] = 33'h03905af56;
      expv[38] = 33'h17b9c9212;
      expv[39] = 33'h0f3d9519e;
      expv[40] = 33'h195b94fd8;
      expv[41] = 33'h045cf9286;
      expv[42] = 33'h0fde2dee2;
      expv[43] = 33'h1518bb4c6;
      expv[44] = 33'h003c44606;
      expv[45] = 33'h0ca8870ba;
      expv[46] = 33'h0a0e1cd47;
      expv[47] = 33'h082a9dbe4;
      expv[48] = 33'h1313a526f;
      expv[49] = 33'h1ac083ec6;
      expv[50] = 33'h0e88f517e;
      expv[51] = 33'h10963b606;
      expv[52] = 33'h10ca7faa6;
      expv[53] = 33'h1fe0812a3;
      expv[54] = 33'h075a01680;
      expv[55] = 33'h193532ec0;
      expv[56] = 33'h07e418988;
      expv[57] = 33'h039aac3ec;
      expv[58] = 33'h035bfe490;
      expv[59] = 33'h117cf73ba;
      expv[60] = 33'h18854ff41;
      expv[61] = 33'h1af0592a2;
      expv[62] = 33'h105c79258;
      expv[63] = 33'h1876a8d28;
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

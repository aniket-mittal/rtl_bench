// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07206 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h16f52ed5;
    stim[1] = 31'h38bc26e1;
    stim[2] = 31'h747c9a33;
    stim[3] = 31'h5d80be4b;
    stim[4] = 31'h6d2bbfbf;
    stim[5] = 31'h70d0f3c5;
    stim[6] = 31'h7792acf8;
    stim[7] = 31'h7e888c71;
    stim[8] = 31'h683230a2;
    stim[9] = 31'h54141fbc;
    stim[10] = 31'h56198156;
    stim[11] = 31'h47a19b60;
    stim[12] = 31'h4618af3e;
    stim[13] = 31'h4605a666;
    stim[14] = 31'h408f395d;
    stim[15] = 31'h5a5b7897;
    stim[16] = 31'h4e080eaf;
    stim[17] = 31'h7ab46e11;
    stim[18] = 31'h72252b65;
    stim[19] = 31'h45c80e41;
    stim[20] = 31'h4ba4b417;
    stim[21] = 31'h5aff7eb4;
    stim[22] = 31'h57b890a1;
    stim[23] = 31'h515d23e5;
    stim[24] = 31'h7c24b757;
    stim[25] = 31'h5dbf884f;
    stim[26] = 31'h7352b387;
    stim[27] = 31'h513fa035;
    stim[28] = 31'h7ad7cda4;
    stim[29] = 31'h47f6d1dc;
    stim[30] = 31'h55623223;
    stim[31] = 31'h40eacae0;
    stim[32] = 31'h4f3a13c4;
    stim[33] = 31'h554bfabd;
    stim[34] = 31'h683e25d5;
    stim[35] = 31'h7ff48e32;
    stim[36] = 31'h555452c7;
    stim[37] = 31'h7e8654a3;
    stim[38] = 31'h5ac3a51b;
    stim[39] = 31'h7d790534;
    stim[40] = 31'h5d398cfd;
    stim[41] = 31'h57189f69;
    stim[42] = 31'h77b08f1e;
    stim[43] = 31'h77ede302;
    stim[44] = 31'h341e00e0;
    stim[45] = 31'h64c60d08;
    stim[46] = 31'h7a000a7a;
    stim[47] = 31'h494bfe4e;
    stim[48] = 31'h61b24f09;
    stim[49] = 31'h4924bb0e;
    stim[50] = 31'h6707870a;
    stim[51] = 31'h6b65a4e4;
    stim[52] = 31'h4eefb72b;
    stim[53] = 31'h45d18ede;
    stim[54] = 31'h7a53f8e3;
    stim[55] = 31'h7dce00ba;
    stim[56] = 31'h439df8fa;
    stim[57] = 31'h7d3681f6;
    stim[58] = 31'h41693666;
    stim[59] = 31'h459efbde;
    stim[60] = 31'h4044ae06;
    stim[61] = 31'h41f931d2;
    stim[62] = 31'h4bef4ac2;
    stim[63] = 31'h640198dc;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'hxxxxxxxxc;
      expv[2] = 36'hxxxxxxxxc;
      expv[3] = 36'h000000004;
      expv[4] = 36'h000000003;
      expv[5] = 36'h0000031fe;
      expv[6] = 36'h000003f21;
      expv[7] = 36'h000000ffb;
      expv[8] = 36'h00000278e;
      expv[9] = 36'h000000619;
      expv[10] = 36'h000000616;
      expv[11] = 36'h000000613;
      expv[12] = 36'h00000061b;
      expv[13] = 36'h00000061e;
      expv[14] = 36'h00000061e;
      expv[15] = 36'h000000611;
      expv[16] = 36'h000000616;
      expv[17] = 36'h00000061e;
      expv[18] = 36'h000007529;
      expv[19] = 36'h000000fd1;
      expv[20] = 36'h000000fd4;
      expv[21] = 36'h000000fde;
      expv[22] = 36'h000000fd1;
      expv[23] = 36'h000000fd6;
      expv[24] = 36'h000000fde;
      expv[25] = 36'h000007784;
      expv[26] = 36'h00000778b;
      expv[27] = 36'h00000316c;
      expv[28] = 36'h000003164;
      expv[29] = 36'h0000015f6;
      expv[30] = 36'h0000015fe;
      expv[31] = 36'h0000015fe;
      expv[32] = 36'h0000015f9;
      expv[33] = 36'h0000015f4;
      expv[34] = 36'h0000015f6;
      expv[35] = 36'h00000739c;
      expv[36] = 36'h000003bd4;
      expv[37] = 36'h000003bde;
      expv[38] = 36'h000003121;
      expv[39] = 36'h00000312b;
      expv[40] = 36'h000002a61;
      expv[41] = 36'h000002a63;
      expv[42] = 36'h000002a6e;
      expv[43] = 36'h000003c31;
      expv[44] = 36'h0000013e3;
      expv[45] = 36'h0000013eb;
      expv[46] = 36'h000000009;
      expv[47] = 36'h0000004c1;
      expv[48] = 36'h0000004c1;
      expv[49] = 36'h000002814;
      expv[50] = 36'h000002816;
      expv[51] = 36'h0000032eb;
      expv[52] = 36'h0000039fc;
      expv[53] = 36'h0000039fc;
      expv[54] = 36'h0000039f6;
      expv[55] = 36'h000001a1e;
      expv[56] = 36'h00000346c;
      expv[57] = 36'h000003464;
      expv[58] = 36'h0000015d6;
      expv[59] = 36'h0000015d6;
      expv[60] = 36'h0000015d6;
      expv[61] = 36'h0000015d3;
      expv[62] = 36'h0000015db;
      expv[63] = 36'h0000015de;
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

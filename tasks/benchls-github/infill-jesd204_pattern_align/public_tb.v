// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jesd204_pattern_align dut (
    .clk(clk),
    .reset(in_vec[41:41]),
    .patternalign_en(in_vec[40:40]),
    .in_data(in_vec[39:0]),
    .out_data(out_vec[39:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h3dd54c9bbdf;
    stim[1] = 42'h274ff97f19d;
    stim[2] = 42'h10061f7c9f6;
    stim[3] = 42'h17ab9463e75;
    stim[4] = 42'h05b00bc474e;
    stim[5] = 42'h0ad2c44f6a4;
    stim[6] = 42'h10a7c0e05d3;
    stim[7] = 42'h1d451b1c720;
    stim[8] = 42'h1eab1098f44;
    stim[9] = 42'h15f04ad2276;
    stim[10] = 42'h076c4e7403a;
    stim[11] = 42'h0e454cc7d0e;
    stim[12] = 42'h02137e3dc72;
    stim[13] = 42'h1127b5d6ac6;
    stim[14] = 42'h029ea7b77aa;
    stim[15] = 42'h05d93d3d415;
    stim[16] = 42'h18b42c09523;
    stim[17] = 42'h18d4690824f;
    stim[18] = 42'h07165a18a63;
    stim[19] = 42'h00e653e8fdc;
    stim[20] = 42'h1b95628a5d9;
    stim[21] = 42'h14d07ba0e4b;
    stim[22] = 42'h10304609341;
    stim[23] = 42'h144461d515a;
    stim[24] = 42'h0bfafc6c24f;
    stim[25] = 42'h17230e56c06;
    stim[26] = 42'h054bfefb5fb;
    stim[27] = 42'h019e400ca06;
    stim[28] = 42'h1341c4987d7;
    stim[29] = 42'h1807c6f49f1;
    stim[30] = 42'h030ab8992a3;
    stim[31] = 42'h18f8318f602;
    stim[32] = 42'h1fbab807207;
    stim[33] = 42'h175ac4025b2;
    stim[34] = 42'h1a1c0ce7daf;
    stim[35] = 42'h0465e19fe50;
    stim[36] = 42'h050e7d8e27d;
    stim[37] = 42'h04d97e15cb3;
    stim[38] = 42'h0c44191a734;
    stim[39] = 42'h10669d6bda4;
    stim[40] = 42'h0dfc73199d8;
    stim[41] = 42'h0b5a6488594;
    stim[42] = 42'h0d5b3d8b321;
    stim[43] = 42'h1f5cf15b8c4;
    stim[44] = 42'h06a28bccd03;
    stim[45] = 42'h0e653adf9f4;
    stim[46] = 42'h0e7cfc90f3d;
    stim[47] = 42'h052b748fbbc;
    stim[48] = 42'h05eb783a040;
    stim[49] = 42'h173c3caf520;
    stim[50] = 42'h17f6945852c;
    stim[51] = 42'h0d3704583cd;
    stim[52] = 42'h1435e9f156a;
    stim[53] = 42'h05e6821b90d;
    stim[54] = 42'h17db5198a1a;
    stim[55] = 42'h116ff138300;
    stim[56] = 42'h14adf165109;
    stim[57] = 42'h1a19bd74306;
    stim[58] = 42'h015e014a723;
    stim[59] = 42'h02309270e10;
    stim[60] = 42'h163297eac2b;
    stim[61] = 42'h1671a87820a;
    stim[62] = 42'h0b9a9876c57;
    stim[63] = 42'h0ab762a37d3;
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
      expv[0] = 40'ha99377be00;
      expv[1] = 40'hff2fe33bba;
      expv[2] = 40'hc3ef93ece9;
      expv[3] = 40'h728c7cea00;
      expv[4] = 40'h01788e9cf5;
      expv[5] = 40'h5889ed48b6;
      expv[6] = 40'hf81c0ba75a;
      expv[7] = 40'h51b1c7200a;
      expv[8] = 40'hb1098f44d4;
      expv[9] = 40'h04ad2276ea;
      expv[10] = 40'hc4e7403a5f;
      expv[11] = 40'h54cc7d0e76;
      expv[12] = 40'h37e3dc72e4;
      expv[13] = 40'h7b5d6ac621;
      expv[14] = 40'hf53dbbd509;
      expv[15] = 40'hc9e9ea0a94;
      expv[16] = 40'ha1604a91ae;
      expv[17] = 40'ha3484127c5;
      expv[18] = 40'h59686298e3;
      expv[19] = 40'h994fa3f71c;
      expv[20] = 40'h558a297643;
      expv[21] = 40'h41ee8392ee;
      expv[22] = 40'h608c126829;
      expv[23] = 40'h88c3aa2b40;
      expv[24] = 40'hf5f8d849e8;
      expv[25] = 40'h461cad80d7;
      expv[26] = 40'h4bfefb5fb7;
      expv[27] = 40'h9e400ca065;
      expv[28] = 40'h41c4987d71;
      expv[29] = 40'h07c6f49f13;
      expv[30] = 40'h855c4c951c;
      expv[31] = 40'h7c18c7b011;
      expv[32] = 40'hdd5c03903c;
      expv[33] = 40'had62012d97;
      expv[34] = 40'h870339f6bd;
      expv[35] = 40'h197867f942;
      expv[36] = 40'h439f6389f5;
      expv[37] = 40'h365f8572cd;
      expv[38] = 40'h1106469cd1;
      expv[39] = 40'h19a75af693;
      expv[40] = 40'hbf8e6333b0;
      expv[41] = 40'h6b4c910b29;
      expv[42] = 40'hab67b16643;
      expv[43] = 40'heb9e2b7189;
      expv[44] = 40'h6a28bccd03;
      expv[45] = 40'he653adf9f4;
      expv[46] = 40'he7cfc90f3d;
      expv[47] = 40'h52b748fbbc;
      expv[48] = 40'h5eb783a040;
      expv[49] = 40'h73c3caf520;
      expv[50] = 40'hd28b0a58e7;
      expv[51] = 40'he08b079afe;
      expv[52] = 40'hbd3e2ad5a6;
      expv[53] = 40'hd043721a86;
      expv[54] = 40'h6a331434bc;
      expv[55] = 40'hff1383007d;
      expv[56] = 40'hdf16510916;
      expv[57] = 40'h9bd743064a;
      expv[58] = 40'he014a723a1;
      expv[59] = 40'h09270e1015;
      expv[60] = 40'h297eac2b23;
      expv[61] = 40'h8d43c10531;
      expv[62] = 40'hd4c3b62bb3;
      expv[63] = 40'hbb151be9dc;
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

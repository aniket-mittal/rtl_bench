// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  inv_mix_one_column dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'he5d3e650;
    stim[1] = 32'h2804d443;
    stim[2] = 32'h2c3ba13f;
    stim[3] = 32'hd4a9e8d5;
    stim[4] = 32'hc90ff8db;
    stim[5] = 32'h19df0164;
    stim[6] = 32'h72286ee1;
    stim[7] = 32'h1740c12c;
    stim[8] = 32'h50cd220c;
    stim[9] = 32'h7d76444a;
    stim[10] = 32'he4bc8f06;
    stim[11] = 32'h56a419db;
    stim[12] = 32'h0fbf127e;
    stim[13] = 32'h0aed9e8f;
    stim[14] = 32'h67989a7f;
    stim[15] = 32'hffc8b5ef;
    stim[16] = 32'h458cece2;
    stim[17] = 32'he5637bab;
    stim[18] = 32'h6c8f8806;
    stim[19] = 32'h809f4c0d;
    stim[20] = 32'h698d84ed;
    stim[21] = 32'hee4775b9;
    stim[22] = 32'hf73e08ec;
    stim[23] = 32'h336f9466;
    stim[24] = 32'h53d4dc76;
    stim[25] = 32'h9a5085ba;
    stim[26] = 32'hbea8530e;
    stim[27] = 32'he38ded30;
    stim[28] = 32'h48fa02c8;
    stim[29] = 32'h41e86802;
    stim[30] = 32'h4851251e;
    stim[31] = 32'hbe539416;
    stim[32] = 32'h387afaef;
    stim[33] = 32'h72329b4c;
    stim[34] = 32'h051662ec;
    stim[35] = 32'hdedb4815;
    stim[36] = 32'h1b215f4a;
    stim[37] = 32'hebc6a6c4;
    stim[38] = 32'h22efcab4;
    stim[39] = 32'h12e5ccd3;
    stim[40] = 32'hc89ebc63;
    stim[41] = 32'h8070af38;
    stim[42] = 32'he17a27ff;
    stim[43] = 32'h3ac1ce31;
    stim[44] = 32'hd7637705;
    stim[45] = 32'hd8f7a334;
    stim[46] = 32'hca3cfb19;
    stim[47] = 32'h6d3b8e2a;
    stim[48] = 32'h0b2e2252;
    stim[49] = 32'haeee7931;
    stim[50] = 32'ha22ecc84;
    stim[51] = 32'hc2f88c3a;
    stim[52] = 32'haa9db51b;
    stim[53] = 32'h2f1751a5;
    stim[54] = 32'haca05ef2;
    stim[55] = 32'h6f6c4eda;
    stim[56] = 32'h96a1f103;
    stim[57] = 32'h312f3c2e;
    stim[58] = 32'hd16499b0;
    stim[59] = 32'hd8f4aa60;
    stim[60] = 32'h27519de5;
    stim[61] = 32'h9c21a010;
    stim[62] = 32'hfa0d4703;
    stim[63] = 32'hf99465cc;
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
      expv[0] = 32'h696f71f7;
      expv[1] = 32'hb9ac2886;
      expv[2] = 32'hada929a4;
      expv[3] = 32'ha8b6144a;
      expv[4] = 32'h160bf60e;
      expv[5] = 32'h226e6788;
      expv[6] = 32'h918a3cf2;
      expv[7] = 32'hd1ef68ec;
      expv[8] = 32'hfe7df1c1;
      expv[9] = 32'ha2cf91f9;
      expv[10] = 32'he0073204;
      expv[11] = 32'h25890a96;
      expv[12] = 32'h66b1d8d3;
      expv[13] = 32'hbe9fdd0a;
      expv[14] = 32'h91e75834;
      expv[15] = 32'h8a861a7b;
      expv[16] = 32'hfb4ac7b1;
      expv[17] = 32'h6c8e5eea;
      expv[18] = 32'h24bb1ae8;
      expv[19] = 32'h3bc44bea;
      expv[20] = 32'haa8d46ec;
      expv[21] = 32'h9d96cca2;
      expv[22] = 32'hf16954e1;
      expv[23] = 32'h880f6841;
      expv[24] = 32'h1224c7dc;
      expv[25] = 32'h75789b63;
      expv[26] = 32'h2ece55fe;
      expv[27] = 32'h5bd32813;
      expv[28] = 32'h914c2b8e;
      expv[29] = 32'h2df79980;
      expv[30] = 32'hfcb7d5bc;
      expv[31] = 32'hedf31968;
      expv[32] = 32'h40da2ce1;
      expv[33] = 32'h38dbe490;
      expv[34] = 32'hbd22fbf9;
      expv[35] = 32'h145d3223;
      expv[36] = 32'h28263213;
      expv[37] = 32'h9f0f4c93;
      expv[38] = 32'h728ee7a8;
      expv[39] = 32'h5b864e7b;
      expv[40] = 32'h02ae7f5a;
      expv[41] = 32'hb59c541a;
      expv[42] = 32'h948fd48c;
      expv[43] = 32'h0e16f2ee;
      expv[44] = 32'hbe648995;
      expv[45] = 32'h7e716ed9;
      expv[46] = 32'h4d895484;
      expv[47] = 32'h432d5fc3;
      expv[48] = 32'h2e16adc0;
      expv[49] = 32'h17c2d00d;
      expv[50] = 32'hbcd141e8;
      expv[51] = 32'h15b55874;
      expv[52] = 32'h85deb371;
      expv[53] = 32'h4a93b7a2;
      expv[54] = 32'h86c32fca;
      expv[55] = 32'hae85ba06;
      expv[56] = 32'hc8083e3b;
      expv[57] = 32'h55614078;
      expv[58] = 32'h8be8e01f;
      expv[59] = 32'hc4b961fa;
      expv[60] = 32'h6b4acde2;
      expv[61] = 32'h68994eb2;
      expv[62] = 32'h91fd518e;
      expv[63] = 32'hdba8d463;
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

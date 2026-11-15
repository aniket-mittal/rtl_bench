// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02700 dut (
    .clk(clk),
    .cur_pc(in_vec[32:1]),
    .rst(in_vec[0:0]),
    .next_pc(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1a167fae5;
    stim[1] = 33'h0dbeeb875;
    stim[2] = 33'h03b9f3be6;
    stim[3] = 33'h04608627c;
    stim[4] = 33'h108e4fed4;
    stim[5] = 33'h142154ef0;
    stim[6] = 33'h088fa4d50;
    stim[7] = 33'h157f8924a;
    stim[8] = 33'h12eab3818;
    stim[9] = 33'h07b468f1e;
    stim[10] = 33'h1a18306cc;
    stim[11] = 33'h1798f2046;
    stim[12] = 33'h18f18adb4;
    stim[13] = 33'h027342458;
    stim[14] = 33'h1e0ebac66;
    stim[15] = 33'h081ca8750;
    stim[16] = 33'h0b32ddb1a;
    stim[17] = 33'h018a2e980;
    stim[18] = 33'h1bed39656;
    stim[19] = 33'h156cc1296;
    stim[20] = 33'h1c359f802;
    stim[21] = 33'h1fc5e402e;
    stim[22] = 33'h05092651c;
    stim[23] = 33'h15dc4b42e;
    stim[24] = 33'h104f075ce;
    stim[25] = 33'h08f4e083d;
    stim[26] = 33'h03e1c42c0;
    stim[27] = 33'h0a6ad3e9a;
    stim[28] = 33'h1ae3c6e80;
    stim[29] = 33'h0dd8f084c;
    stim[30] = 33'h0634210ca;
    stim[31] = 33'h076c1db2c;
    stim[32] = 33'h1bdd86b44;
    stim[33] = 33'h17e6ce00a;
    stim[34] = 33'h01ad681fc;
    stim[35] = 33'h19c05ef2e;
    stim[36] = 33'h1e13131d8;
    stim[37] = 33'h04180b93c;
    stim[38] = 33'h04c3b0804;
    stim[39] = 33'h002ac0aa2;
    stim[40] = 33'h0992b07b8;
    stim[41] = 33'h0cbe5755c;
    stim[42] = 33'h1f9d98b82;
    stim[43] = 33'h10e6ca0d0;
    stim[44] = 33'h19bd8e538;
    stim[45] = 33'h0ae19fbf8;
    stim[46] = 33'h0467f0d56;
    stim[47] = 33'h0dfa1e2a8;
    stim[48] = 33'h180dd29ba;
    stim[49] = 33'h15289476b;
    stim[50] = 33'h115fc7d6c;
    stim[51] = 33'h0cf1ba842;
    stim[52] = 33'h04c7a88fc;
    stim[53] = 33'h1da63a900;
    stim[54] = 33'h0b04b150c;
    stim[55] = 33'h0657ba6de;
    stim[56] = 33'h109cbcb16;
    stim[57] = 33'h1effb2d20;
    stim[58] = 33'h0ea89baa4;
    stim[59] = 33'h062d38de4;
    stim[60] = 33'h18c2db882;
    stim[61] = 33'h0ef1a52b0;
    stim[62] = 33'h025b4fa18;
    stim[63] = 33'h0d05e8d4c;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h1dcf9df7;
      expv[4] = 32'h23043142;
      expv[5] = 32'h84727f6e;
      expv[6] = 32'ha10aa77c;
      expv[7] = 32'h447d26ac;
      expv[8] = 32'habfc4929;
      expv[9] = 32'h97559c10;
      expv[10] = 32'h3da34793;
      expv[11] = 32'hd0c1836a;
      expv[12] = 32'hbcc79027;
      expv[13] = 32'hc78c56de;
      expv[14] = 32'h139a1230;
      expv[15] = 32'hf075d637;
      expv[16] = 32'h40e543ac;
      expv[17] = 32'h5996ed91;
      expv[18] = 32'h0c5174c4;
      expv[19] = 32'hdf69cb2f;
      expv[20] = 32'hab66094f;
      expv[21] = 32'he1acfc05;
      expv[22] = 32'hfe2f201b;
      expv[23] = 32'h28493292;
      expv[24] = 32'haee25a1b;
      expv[25] = 32'h82783aeb;
      expv[26] = 32'h00000000;
      expv[27] = 32'h1f0e2164;
      expv[28] = 32'h53569f51;
      expv[29] = 32'hd71e3744;
      expv[30] = 32'h6ec7842a;
      expv[31] = 32'h31a10869;
      expv[32] = 32'h3b60ed9a;
      expv[33] = 32'hdeec35a6;
      expv[34] = 32'hbf367009;
      expv[35] = 32'h0d6b4102;
      expv[36] = 32'hce02f79b;
      expv[37] = 32'hf09898f0;
      expv[38] = 32'h20c05ca2;
      expv[39] = 32'h261d8406;
      expv[40] = 32'h01560555;
      expv[41] = 32'h4c9583e0;
      expv[42] = 32'h65f2bab2;
      expv[43] = 32'hfcecc5c5;
      expv[44] = 32'h8736506c;
      expv[45] = 32'hcdec72a0;
      expv[46] = 32'h570cfe00;
      expv[47] = 32'h233f86af;
      expv[48] = 32'h6fd0f158;
      expv[49] = 32'hc06e94e1;
      expv[50] = 32'h00000000;
      expv[51] = 32'h8afe3eba;
      expv[52] = 32'h678dd425;
      expv[53] = 32'h263d4482;
      expv[54] = 32'hed31d484;
      expv[55] = 32'h58258a8a;
      expv[56] = 32'h32bdd373;
      expv[57] = 32'h84e5e58f;
      expv[58] = 32'hf7fd9694;
      expv[59] = 32'h7544dd56;
      expv[60] = 32'h3169c6f6;
      expv[61] = 32'hc616dc45;
      expv[62] = 32'h778d295c;
      expv[63] = 32'h12da7d10;
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

// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05288 dut (
    .clk(clk),
    .ir(in_vec[52:4]),
    .idebug(in_vec[3:3]),
    .iwrited(in_vec[2:2]),
    .nop(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .funct(out_vec[38:35]),
    .dest(out_vec[34:34]),
    .div(out_vec[33:33]),
    .imod(out_vec[32:32]),
    .iralu(out_vec[31:31]),
    .irbyte(out_vec[30:30]),
    .irdisp(out_vec[29:29]),
    .irjump(out_vec[28:28]),
    .mul(out_vec[27:27]),
    .destlc(out_vec[26:26]),
    .destintctl(out_vec[25:25]),
    .destpdltop(out_vec[24:24]),
    .destpdl_p(out_vec[23:23]),
    .destpdl_x(out_vec[22:22]),
    .destpdlx(out_vec[21:21]),
    .destpdlp(out_vec[20:20]),
    .destspc(out_vec[19:19]),
    .destimod0(out_vec[18:18]),
    .destimod1(out_vec[17:17]),
    .destvma(out_vec[16:16]),
    .destmdr(out_vec[15:15]),
    .destmem(out_vec[14:14]),
    .destm(out_vec[13:13]),
    .srcdc(out_vec[12:12]),
    .srcspc(out_vec[11:11]),
    .srcpdlptr(out_vec[10:10]),
    .srcpdlidx(out_vec[9:9]),
    .srcpdltop(out_vec[8:8]),
    .srcopc(out_vec[7:7]),
    .srcq(out_vec[6:6]),
    .srcvma(out_vec[5:5]),
    .srcmap(out_vec[4:4]),
    .srcmd(out_vec[3:3]),
    .srclc(out_vec[2:2]),
    .srcspcpop(out_vec[1:1]),
    .srcpdlpop(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h13350b94e768d5;
    stim[1] = 53'h0dbc7a7fa7320d;
    stim[2] = 53'h0eb6c22e13217e;
    stim[3] = 53'h1499c4af7aeb80;
    stim[4] = 53'h172b19e0970454;
    stim[5] = 53'h0ad87e5589e0dc;
    stim[6] = 53'h1001e1be33b10a;
    stim[7] = 53'h0f82f07d4b199c;
    stim[8] = 53'h115f7c27d687b8;
    stim[9] = 53'h0b7b1905340c08;
    stim[10] = 53'h13274330d9d92e;
    stim[11] = 53'h1140c87663e6e6;
    stim[12] = 53'h12c4010a1c3092;
    stim[13] = 53'h149d5068df2c42;
    stim[14] = 53'h0c0d96e6fd6264;
    stim[15] = 53'h01711658b3135e;
    stim[16] = 53'h1723500def04ee;
    stim[17] = 53'h1b46796b7bcd60;
    stim[18] = 53'h0833d6f3a68ece;
    stim[19] = 53'h0cfe156a8cbe1c;
    stim[20] = 53'h1555d443d090ae;
    stim[21] = 53'h0b5e42517e1d0e;
    stim[22] = 53'h165e29d7719a24;
    stim[23] = 53'h1c13facf2e22a4;
    stim[24] = 53'h17776eb2491c5a;
    stim[25] = 53'h00e8d16bf5d546;
    stim[26] = 53'h17653d4ebf41f8;
    stim[27] = 53'h0f593e5fac029a;
    stim[28] = 53'h1da38e87e2890a;
    stim[29] = 53'h11c1bd4a8774e4;
    stim[30] = 53'h0b2aa8c2b74c3e;
    stim[31] = 53'h1966ed67aeaea8;
    stim[32] = 53'h0483d3fc891c2c;
    stim[33] = 53'h1e2c1671f24aa6;
    stim[34] = 53'h17b4a6b1342c6c;
    stim[35] = 53'h184e85bd40e428;
    stim[36] = 53'h08567e3798ac7c;
    stim[37] = 53'h01e1cef47ab314;
    stim[38] = 53'h191735cd011d5a;
    stim[39] = 53'h15ad55859fddd6;
    stim[40] = 53'h12c5bdc8cfc81c;
    stim[41] = 53'h08c23cab3dcd22;
    stim[42] = 53'h0876a8b253524e;
    stim[43] = 53'h0f4435fd92727a;
    stim[44] = 53'h023b7183290c24;
    stim[45] = 53'h036e2615e5f038;
    stim[46] = 53'h1cb159dd7de11a;
    stim[47] = 53'h10bda17e1cbc78;
    stim[48] = 53'h159b48d83d97fe;
    stim[49] = 53'h065a851e8a0348;
    stim[50] = 53'h01cd25236e1b30;
    stim[51] = 53'h0acf542a0d2db4;
    stim[52] = 53'h162653b831e6e6;
    stim[53] = 53'h10537c0d444dea;
    stim[54] = 53'h09aa4a72bd6522;
    stim[55] = 53'h06a523bef46734;
    stim[56] = 53'h14525f1f1e823c;
    stim[57] = 53'h1aae8c01dc1f20;
    stim[58] = 53'h00fb8ac03d1ada;
    stim[59] = 53'h12c7f311023a3a;
    stim[60] = 53'h119a5d1418b6da;
    stim[61] = 53'h0689e318a81752;
    stim[62] = 53'h147b1c5da06587;
    stim[63] = 53'h13f556052e1316;
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
      expv[0] = 39'h1120000000;
      expv[1] = 39'h0d40000010;
      expv[2] = 39'h0100000000;
      expv[3] = 39'h4010000000;
      expv[4] = 39'h0920000040;
      expv[5] = 39'h4110000010;
      expv[6] = 39'h0100000000;
      expv[7] = 39'h0d40000000;
      expv[8] = 39'h2120001000;
      expv[9] = 39'h0920000001;
      expv[10] = 39'h0100000000;
      expv[11] = 39'h0100000800;
      expv[12] = 39'h0000000000;
      expv[13] = 39'h0000000000;
      expv[14] = 39'h1580000000;
      expv[15] = 39'h0100000000;
      expv[16] = 39'h0100000000;
      expv[17] = 39'h4020000100;
      expv[18] = 39'h0100000000;
      expv[19] = 39'h2110000000;
      expv[20] = 39'h0100000000;
      expv[21] = 39'h0100000000;
      expv[22] = 39'h2588042040;
      expv[23] = 39'h0d8000e004;
      expv[24] = 39'h0100000008;
      expv[25] = 39'h0100000000;
      expv[26] = 39'h1120000100;
      expv[27] = 39'h0100000010;
      expv[28] = 39'h0100000008;
      expv[29] = 39'h1540016100;
      expv[30] = 39'h0100000200;
      expv[31] = 39'h2120000100;
      expv[32] = 39'h0910000000;
      expv[33] = 39'h0100000000;
      expv[34] = 39'h0d40000000;
      expv[35] = 39'h4580000000;
      expv[36] = 39'h2580000020;
      expv[37] = 39'h2540000004;
      expv[38] = 39'h0100000000;
      expv[39] = 39'h0100000000;
      expv[40] = 39'h4110000040;
      expv[41] = 39'h0000000400;
      expv[42] = 39'h0100000400;
      expv[43] = 39'h0100000000;
      expv[44] = 39'h0d80002000;
      expv[45] = 39'h4120000000;
      expv[46] = 39'h0100000040;
      expv[47] = 39'h2110000000;
      expv[48] = 39'h0100000200;
      expv[49] = 39'h0d8000e000;
      expv[50] = 39'h0c40000000;
      expv[51] = 39'h0910000000;
      expv[52] = 39'h0100000000;
      expv[53] = 39'h0100001000;
      expv[54] = 39'h0000000010;
      expv[55] = 39'h1110000000;
      expv[56] = 39'h258000e002;
      expv[57] = 39'h0810001000;
      expv[58] = 39'h0100000004;
      expv[59] = 39'h0100000000;
      expv[60] = 39'h0100000001;
      expv[61] = 39'h0000000000;
      expv[62] = 39'h0100000800;
      expv[63] = 39'h0100000000;
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

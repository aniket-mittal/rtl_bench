// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02126 dut (
    .clk(clk),
    .downstream_readdata(in_vec[52:37]),
    .downstream_readdatavalid(in_vec[36:36]),
    .downstream_waitrequest(in_vec[35:35]),
    .reset_n(in_vec[34:34]),
    .upstream_address(in_vec[33:29]),
    .upstream_burstcount(in_vec[28:25]),
    .upstream_byteenable(in_vec[24:23]),
    .upstream_debugaccess(in_vec[22:22]),
    .upstream_nativeaddress(in_vec[21:18]),
    .upstream_read(in_vec[17:17]),
    .upstream_write(in_vec[16:16]),
    .upstream_writedata(in_vec[15:0]),
    .reg_downstream_address(out_vec[52:49]),
    .reg_downstream_arbitrationshare(out_vec[48:44]),
    .reg_downstream_burstcount(out_vec[43:43]),
    .reg_downstream_byteenable(out_vec[42:41]),
    .reg_downstream_debugaccess(out_vec[40:40]),
    .reg_downstream_nativeaddress(out_vec[39:36]),
    .reg_downstream_read(out_vec[35:35]),
    .reg_downstream_write(out_vec[34:34]),
    .reg_downstream_writedata(out_vec[33:18]),
    .upstream_readdata(out_vec[17:2]),
    .upstream_readdatavalid(out_vec[1:1]),
    .upstream_waitrequest(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h1d572ad8eff091;
    stim[1] = 53'h12e5797826ffde;
    stim[2] = 53'h11083c685ebe3e;
    stim[3] = 53'h06dde59d3b6d83;
    stim[4] = 53'h0aeb7ddfa6ba32;
    stim[5] = 53'h0f6cee9283103c;
    stim[6] = 53'h13762521165fab;
    stim[7] = 53'h0601d6faabd72c;
    stim[8] = 53'h079b84b94f78bf;
    stim[9] = 53'h03a0be1bb5c398;
    stim[10] = 53'h0302acbe949eb1;
    stim[11] = 53'h1835ada5ea4012;
    stim[12] = 53'h169c8608b2dcfb;
    stim[13] = 53'h096224fe688f12;
    stim[14] = 53'h04492f46f3e5d2;
    stim[15] = 53'h057e2fab5ab61a;
    stim[16] = 53'h1032c7d64fdfcf;
    stim[17] = 53'h1d4bae21529025;
    stim[18] = 53'h02b8a61af8daf2;
    stim[19] = 53'h124896d41d25c1;
    stim[20] = 53'h07debe395b203f;
    stim[21] = 53'h05d6fcd2d34d9f;
    stim[22] = 53'h19a57d8291e23c;
    stim[23] = 53'h0b30a5b61fbb5f;
    stim[24] = 53'h0550947e614698;
    stim[25] = 53'h03933f5940c0ea;
    stim[26] = 53'h05da5e61ca6294;
    stim[27] = 53'h0f798dce3d9fe2;
    stim[28] = 53'h1a8f8f1d351945;
    stim[29] = 53'h1b244f4d7ff24e;
    stim[30] = 53'h1bad655e74ff00;
    stim[31] = 53'h105bc5ae79eb34;
    stim[32] = 53'h0bb5fdcbd3d680;
    stim[33] = 53'h124ad62dd2d0b9;
    stim[34] = 53'h0175ae2ecdfea8;
    stim[35] = 53'h045e65c0cd015d;
    stim[36] = 53'h1e9e06795646ce;
    stim[37] = 53'h1dac1c60aadd57;
    stim[38] = 53'h0664c773ee7018;
    stim[39] = 53'h0948f62791f0a4;
    stim[40] = 53'h1ab38f9c84e13f;
    stim[41] = 53'h17ba85e60200c1;
    stim[42] = 53'h083677245a5b35;
    stim[43] = 53'h11ac6d8186e0c2;
    stim[44] = 53'h07354c4de592c4;
    stim[45] = 53'h005a7ddfcba045;
    stim[46] = 53'h0b85d67076f3e6;
    stim[47] = 53'h02b394b1b9f9b3;
    stim[48] = 53'h0336f609ac5f45;
    stim[49] = 53'h1b33558b568267;
    stim[50] = 53'h0867d7e55573f1;
    stim[51] = 53'h188f5d5ada99d2;
    stim[52] = 53'h02ffc674bdefab;
    stim[53] = 53'h1c1edd82f787f6;
    stim[54] = 53'h1be6c73337e795;
    stim[55] = 53'h0cc89f7817896d;
    stim[56] = 53'h1a48a641fe46fc;
    stim[57] = 53'h18f77d8b2c604a;
    stim[58] = 53'h1087576c022ac4;
    stim[59] = 53'h08961e014539cc;
    stim[60] = 53'h169c6ec1af15be;
    stim[61] = 53'h12228e08a6ccd9;
    stim[62] = 53'h0621c72606e334;
    stim[63] = 53'h1f1926525feb78;
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
      expv[0] = 53'h00000000000001;
      expv[1] = 53'h00000000000001;
      expv[2] = 53'h00000000000001;
      expv[3] = 53'h00000000022106;
      expv[4] = 53'h18ece9b60cdbbd;
      expv[5] = 53'h18ece9b60d5d6f;
      expv[6] = 53'h18ece9b60ded9d;
      expv[7] = 53'h180c597eae6ec5;
      expv[8] = 53'h18daab5cb0c03b;
      expv[9] = 53'h18cd39e2fcf371;
      expv[10] = 53'h18cd39e2fc7417;
      expv[11] = 53'h18cd39e2fc6055;
      expv[12] = 53'h18cd39e2ff06b5;
      expv[13] = 53'h184acb73eed391;
      expv[14] = 53'h18f9aa3c492c45;
      expv[15] = 53'h18f9aa3c488925;
      expv[16] = 53'h18f9aa3c48afc4;
      expv[17] = 53'h1cb93b7f3e0659;
      expv[18] = 53'h1cb93b7f3fa975;
      expv[19] = 53'h1cdbeb6bc85715;
      expv[20] = 53'h1ca87897064913;
      expv[21] = 53'h1ca8789704fbd7;
      expv[22] = 53'h1ca8789704badf;
      expv[23] = 53'h1ca878970734ae;
      expv[24] = 53'h1ab87aed7d6615;
      expv[25] = 53'h1af9891a60aa13;
      expv[26] = 53'h1af9891a607267;
      expv[27] = 53'h1af9891a60bb4b;
      expv[28] = 53'h1af9891a61ef31;
      expv[29] = 53'h1af9891a6351f1;
      expv[30] = 53'h1af9891a636489;
      expv[31] = 53'h1af9dbfc0375ac;
      expv[32] = 53'h1a79e7acd20b79;
      expv[33] = 53'h1a79e7acd176be;
      expv[34] = 53'h026f4b42e6495b;
      expv[35] = 53'h026f4b42e42eb5;
      expv[36] = 53'h020b3805748bcd;
      expv[37] = 53'h02cd591b3bd3c1;
      expv[38] = 53'h02cd591b3bb583;
      expv[39] = 53'h029fb9c060cc99;
      expv[40] = 53'h023e4bc291291f;
      expv[41] = 53'h023e4bc2935671;
      expv[42] = 53'h0238080306f750;
      expv[43] = 53'h1229696cd506cf;
      expv[44] = 53'h1229696cd6358d;
      expv[45] = 53'h1229696cd4e6a9;
      expv[46] = 53'h1229696cd40b4f;
      expv[47] = 53'h1289dbcf9970ba;
      expv[48] = 53'h0a8ee7e6cc5672;
      expv[49] = 53'h004eb17d1466de;
      expv[50] = 53'h185d5a099f666b;
      expv[51] = 53'h182d59cfc50cfb;
      expv[52] = 53'h182d59cfc711eb;
      expv[53] = 53'h18aafbbeac5ff9;
      expv[54] = 53'h18aafbbeaf83db;
      expv[55] = 53'h189cdb9e577cd9;
      expv[56] = 53'h189cdb9e559913;
      expv[57] = 53'h180ff91bf34915;
      expv[58] = 53'h180ff91bf31eee;
      expv[59] = 53'h166808ab1210eb;
      expv[60] = 53'h166808ab1112c3;
      expv[61] = 53'h166808ab12d38d;
      expv[62] = 53'h166808ab124451;
      expv[63] = 53'h16381b8cd0c439;
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

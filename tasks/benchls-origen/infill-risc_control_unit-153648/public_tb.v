// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 60;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_153648 dut (
    .clk(clk),
    .rst(in_vec[41:41]),
    .carryout(in_vec[40:40]),
    .result(in_vec[39:32]),
    .read1(in_vec[31:24]),
    .read2(in_vec[23:16]),
    .instruction(in_vec[15:8]),
    .data(in_vec[7:0]),
    .ctrl0(out_vec[59:58]),
    .ctrl1(out_vec[57:57]),
    .clear(out_vec[56:56]),
    .reg1(out_vec[55:55]),
    .reg2(out_vec[54:54]),
    .write(out_vec[53:53]),
    .opcode(out_vec[52:49]),
    .address(out_vec[48:41]),
    .input1(out_vec[40:33]),
    .input2(out_vec[32:25]),
    .datareg(out_vec[24:17]),
    .out(out_vec[16:9]),
    .jump(out_vec[8:8]),
    .jumpaddress(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h24e83243b48;
    stim[1] = 42'h32af0491593;
    stim[2] = 42'h1d08ba619fe;
    stim[3] = 42'h11d4126f784;
    stim[4] = 42'h0c4d5393af9;
    stim[5] = 42'h1329c91c91c;
    stim[6] = 42'h0c9317ca789;
    stim[7] = 42'h1b5bf105cb1;
    stim[8] = 42'h10fc582e066;
    stim[9] = 42'h11546cbac2d;
    stim[10] = 42'h0aef0f40c48;
    stim[11] = 42'h0b04043a930;
    stim[12] = 42'h170a06da46f;
    stim[13] = 42'h0fe5480ec1b;
    stim[14] = 42'h155fd7ec610;
    stim[15] = 42'h08428ff5033;
    stim[16] = 42'h0757f4776e2;
    stim[17] = 42'h153eb23c7a9;
    stim[18] = 42'h1c9b6734c2e;
    stim[19] = 42'h013959c847c;
    stim[20] = 42'h089091d5bc1;
    stim[21] = 42'h0993a178ef8;
    stim[22] = 42'h00103fc9027;
    stim[23] = 42'h0773e401a3b;
    stim[24] = 42'h161ca27a870;
    stim[25] = 42'h199b4e45e30;
    stim[26] = 42'h06f5181c6e5;
    stim[27] = 42'h09f9fcbd6ad;
    stim[28] = 42'h1bc0d81954e;
    stim[29] = 42'h09e2687ee0b;
    stim[30] = 42'h0ed8cf220ea;
    stim[31] = 42'h1d6c4f64927;
    stim[32] = 42'h16d05118228;
    stim[33] = 42'h102308dfc28;
    stim[34] = 42'h19b16caa2c9;
    stim[35] = 42'h1003970247c;
    stim[36] = 42'h0b65dc07272;
    stim[37] = 42'h32304eaa669;
    stim[38] = 42'h19c71637670;
    stim[39] = 42'h176466f4314;
    stim[40] = 42'h041fca20b59;
    stim[41] = 42'h122aac8e4dc;
    stim[42] = 42'h0dcee0546b8;
    stim[43] = 42'h1dcc94e1725;
    stim[44] = 42'h1fe42e95342;
    stim[45] = 42'h1a2d03e6401;
    stim[46] = 42'h079a5e7fc46;
    stim[47] = 42'h18f337f64e1;
    stim[48] = 42'h00690503248;
    stim[49] = 42'h1acbaf47dbd;
    stim[50] = 42'h0ea34450104;
    stim[51] = 42'h04e2ba88a5e;
    stim[52] = 42'h02e98447bb6;
    stim[53] = 42'h148e59554e0;
    stim[54] = 42'h15a23e99c4d;
    stim[55] = 42'h004bd01b22a;
    stim[56] = 42'h0f307030c88;
    stim[57] = 42'h1321c579177;
    stim[58] = 42'h1bf553aca04;
    stim[59] = 42'h0824a9db1fb;
    stim[60] = 42'h0e724b55411;
    stim[61] = 42'h0b4ec30419d;
    stim[62] = 42'h0f4247dea33;
    stim[63] = 42'h17750583952;
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
      expv[0] = 60'h000000000000000;
      expv[1] = 60'h000000000000000;
      expv[2] = 60'h000000000000000;
      expv[3] = 60'h401160000000000;
      expv[4] = 60'h41f160000000000;
      expv[5] = 60'h41faa0000000000;
      expv[6] = 60'h419aa0000000000;
      expv[7] = 60'h419aa0000000000;
      expv[8] = 60'h519aa0000000000;
      expv[9] = 60'h5198a0000000000;
      expv[10] = 60'h5158a0000000000;
      expv[11] = 60'h5158a0000000000;
      expv[12] = 60'h5158a0000000000;
      expv[13] = 60'h515400000000000;
      expv[14] = 60'h51d400000000000;
      expv[15] = 60'h51d400000000110;
      expv[16] = 60'h51c200000000110;
      expv[17] = 60'h50e200000000110;
      expv[18] = 60'h50e2000000001a9;
      expv[19] = 60'h50f5200000001a9;
      expv[20] = 60'h5115200000001a9;
      expv[21] = 60'h5115200000001a9;
      expv[22] = 60'h5115200000001a9;
      expv[23] = 60'h5115200000001a9;
      expv[24] = 60'hba3527c80ee01a9;
      expv[25] = 60'h7a3527c80ee01a9;
      expv[26] = 60'h7ab527c80ee01a9;
      expv[27] = 60'h7ab527c80ee01e5;
      expv[28] = 60'h7abca7c80ee01e5;
      expv[29] = 60'h7b3ca7c80ee01e5;
      expv[30] = 60'h7b3ca7c80ee01e5;
      expv[31] = 60'h7b3ca7c80ee01e5;
      expv[32] = 60'h7b3ca7c80ee01e5;
      expv[33] = 60'h7b1ca7c80ee01e5;
      expv[34] = 60'h7b1ca7c80ee01e5;
      expv[35] = 60'h7b1ca7c80ee01e5;
      expv[36] = 60'h7b1ca7c80ee01e5;
      expv[37] = 60'h000000000000000;
      expv[38] = 60'h000000000000000;
      expv[39] = 60'h400e20000000000;
      expv[40] = 60'h408e20000000000;
      expv[41] = 60'h408e20000000000;
      expv[42] = 60'h508e20000000000;
      expv[43] = 60'h509dc0000000000;
      expv[44] = 60'hba3dd929db80000;
      expv[45] = 60'h7a285929db80000;
      expv[46] = 60'h7ac85929db80000;
      expv[47] = 60'h7ac85929db80000;
      expv[48] = 60'h7ac85929db80000;
      expv[49] = 60'h7ad21929db80000;
      expv[50] = 60'h7af21929db80000;
      expv[51] = 60'h7af21929db80000;
      expv[52] = 60'h7af21929db80000;
      expv[53] = 60'h7af31929db80000;
      expv[54] = 60'h7ab31929db80000;
      expv[55] = 60'h7ab31929db80000;
      expv[56] = 60'h7ab31929db80000;
      expv[57] = 60'h7aa0f929db80000;
      expv[58] = 60'h7b20f929db80000;
      expv[59] = 60'h7b20f929db80104;
      expv[60] = 60'h7b209929db80104;
      expv[61] = 60'h7aa09929db80104;
      expv[62] = 60'h7aa09929db80104;
      expv[63] = 60'h7aa09929db80104;
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

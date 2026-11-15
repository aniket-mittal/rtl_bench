// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09380 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h182e07aa80ceec76cd14787be655755;
    stim[1] = 122'h3b4205b77631613fd03bca0afe330d5;
    stim[2] = 122'h320df844aeaad09fe2627aee20fd1e6;
    stim[3] = 122'h1e00886131757eb1acc4a6e2297a78b;
    stim[4] = 122'h282772caa4eed20eee79899dc0e75df;
    stim[5] = 122'h2ab10eb927af978bc3d840d70bfe437;
    stim[6] = 122'h10b2abbb6ec6999255487f70b90c58a;
    stim[7] = 122'h23d4542ae25a48e9d6e764f8e62474b;
    stim[8] = 122'h07f4effe55dbd9351ffe5d78b6707eb;
    stim[9] = 122'h1d2e59e6794491075be97df84681133;
    stim[10] = 122'h15d9fefd71886a815bebc8af6289597;
    stim[11] = 122'h1cf6c4e97a2dae32027f15325574287;
    stim[12] = 122'h22cd232c1522795019471db144f41a9;
    stim[13] = 122'h328cd1db309e3399a5fdfe695d528e5;
    stim[14] = 122'h16dfde57a2c26792d1e270ef901f364;
    stim[15] = 122'h2c41c1ac7e09970a0742ecdc97ed7bc;
    stim[16] = 122'h12f5542bb9d14ed185c9adcebbcb871;
    stim[17] = 122'h0f1ac367f6ad853e3663409d08d4847;
    stim[18] = 122'h36dede3da1ca6909e6f8ecbe4842145;
    stim[19] = 122'h091896a9230d941a51c0c8e47130f32;
    stim[20] = 122'h1553b380e9006e53fc64921e95cec4f;
    stim[21] = 122'h35581d6d58cb91d293f10ca21fa7e8c;
    stim[22] = 122'h36c6b4d1a9dd5ab85ae443d30196b87;
    stim[23] = 122'h0b7cac7eea44d51cb85ab7bad2dc081;
    stim[24] = 122'h26f7809131a11f1218ff392e1da4ba8;
    stim[25] = 122'h0abcc1b8a4d9385ccd6c9839ef13d72;
    stim[26] = 122'h3e3916d5e6ac2870876cee86d7f439d;
    stim[27] = 122'h36a9656368dff2b1e23a26c9d4b1419;
    stim[28] = 122'h18498aa5087bf4a3014e7ee9362a16e;
    stim[29] = 122'h0dff8fec6db2ae948e72f3436810628;
    stim[30] = 122'h04c41c6c3ecc9fb0a5b453c6419b63a;
    stim[31] = 122'h17d7cd27cbbf0eae334d44202d12979;
    stim[32] = 122'h2274edbf6804200cba60be57ff9eccc;
    stim[33] = 122'h3790632f2ca459c14cea9f0ae577ca6;
    stim[34] = 122'h39857aebf199eb6badc3abee51cb451;
    stim[35] = 122'h38b34cb0c043b21cb2e11262b791df3;
    stim[36] = 122'h22abf0593682e91943ec1096442400d;
    stim[37] = 122'h353da5a13f24be78ff416e0075d752e;
    stim[38] = 122'h100ed6820a439ce24570c0c45a23e22;
    stim[39] = 122'h04fb1b5285958311bfdcaa8deaacab3;
    stim[40] = 122'h03c316eefe06666373588ec10b01b04;
    stim[41] = 122'h106b4f45cb77b3c3d0681dff1e0de4d;
    stim[42] = 122'h36126fe8880d54c4ef25b65975f46d7;
    stim[43] = 122'h11fb0fff053e23cb494288a252d279a;
    stim[44] = 122'h0ecaa9cf8178f3d0025acbe58886da4;
    stim[45] = 122'h17afe56f6346c1765ffb0bcd786c8fa;
    stim[46] = 122'h0261cb36f33c370e15793766391e83a;
    stim[47] = 122'h2b0c8b9dd65c9cc9e4d477614e3a0de;
    stim[48] = 122'h3dcaf8b2a1633b5edc64f65dac8409a;
    stim[49] = 122'h268a086142847daaf76129dbba0a5f1;
    stim[50] = 122'h2d419b4b19a1c40a37c8220bcc9a5ef;
    stim[51] = 122'h3ad19b7b1a8a595644f10129d999aa9;
    stim[52] = 122'h2d816107973d590678e3fa0e8483411;
    stim[53] = 122'h3d3452ce4f6388b085f240c66271de2;
    stim[54] = 122'h2d85a3fc51b8f040b357079e1ee33cc;
    stim[55] = 122'h2ee4d6d57faeff53c8d511907672de9;
    stim[56] = 122'h29ba49fe9d3783e10afeab6201d810a;
    stim[57] = 122'h3df52471fb5afbc6acded0f7f8281a6;
    stim[58] = 122'h11f2f376ef670d76997942968cccbdc;
    stim[59] = 122'h252a7717cf39f300faeccae0094df02;
    stim[60] = 122'h0578c1c960b9d5ba556f715f4a259f6;
    stim[61] = 122'h32b52c3c66d20c4028682b7df58a84a;
    stim[62] = 122'h0533af567874ed0cab4dab5c0b427a9;
    stim[63] = 122'h0ebf10fe15f0ea5f06db332322513c0;
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
      expv[0] = 53'h0000000000xxxx;
      expv[1] = 53'h0000000000xxxx;
      expv[2] = 53'h0000000000xxxx;
      expv[3] = 53'hxxxxxxxxxxxxxx;
      expv[4] = 53'hxxxxxxxxxxxxxx;
      expv[5] = 53'hxxxxxxxxxxxxxx;
      expv[6] = 53'hxxxxxxxxxxxxxx;
      expv[7] = 53'hxxxxxxxxxxxxxx;
      expv[8] = 53'hxxxxxxxxxxxxxx;
      expv[9] = 53'hxxxxxxxxxxxxxx;
      expv[10] = 53'hxxxxxxxxxxxxxx;
      expv[11] = 53'hxxxxxxxxxxxxxx;
      expv[12] = 53'hxxxxxxxxxxxxxx;
      expv[13] = 53'hxxxxxxxxxxxxxx;
      expv[14] = 53'hxxxxxxxxxxxxxx;
      expv[15] = 53'hxxxxxxxxxxxxxx;
      expv[16] = 53'hxxxxxxxxxxxxxx;
      expv[17] = 53'hxxxxxxxxxxxxxx;
      expv[18] = 53'hxxxxxxxxxxxxxx;
      expv[19] = 53'hxxxxxxxxxxxxxx;
      expv[20] = 53'hxxxxxxxxxxxxxx;
      expv[21] = 53'hxxxxxxxxxxxxxx;
      expv[22] = 53'hxxxxxxxxxxxxxx;
      expv[23] = 53'hxxxxxxxxxxxxxx;
      expv[24] = 53'hxxxxxxxxxxxxxx;
      expv[25] = 53'hxxxxxxxxxxxxxx;
      expv[26] = 53'hxxxxxxxxxxxxxx;
      expv[27] = 53'h0000000000xxxx;
      expv[28] = 53'h0000000000xxxx;
      expv[29] = 53'hxxxxxxxxxxxxxx;
      expv[30] = 53'h0000000000xxxx;
      expv[31] = 53'h0000000000xxxx;
      expv[32] = 53'hxxxxxxxxxxxxxx;
      expv[33] = 53'hxxxxxxxxxxxxxx;
      expv[34] = 53'hxxxxxxxxxxxxxx;
      expv[35] = 53'hxxxxxxxxxxxxxx;
      expv[36] = 53'hxxxxxxxxxxxxxx;
      expv[37] = 53'hxxxxxxxxxxxxxx;
      expv[38] = 53'hxxxxxxxxxxxxxx;
      expv[39] = 53'hxxxxxxxxxxxxxx;
      expv[40] = 53'hxxxxxxxxxxxxxx;
      expv[41] = 53'hxxxxxxxxxxxxxx;
      expv[42] = 53'h0000000000xxxx;
      expv[43] = 53'h0000000000xxxx;
      expv[44] = 53'hxxxxxxxxxxxxxx;
      expv[45] = 53'hxxxxxxxxxxxxxx;
      expv[46] = 53'hxxxxxxxxxxxxxx;
      expv[47] = 53'hxxxxxxxxxxxxxx;
      expv[48] = 53'hxxxxxxxxxxxxxx;
      expv[49] = 53'hxxxxxxxxxxxxxx;
      expv[50] = 53'hxxxxxxxxxxxxxx;
      expv[51] = 53'hxxxxxxxxxxxxxx;
      expv[52] = 53'hxxxxxxxxxxxxxx;
      expv[53] = 53'hxxxxxxxxxxxxxx;
      expv[54] = 53'hxxxxxxxxxxxxxx;
      expv[55] = 53'hxxxxxxxxxxxxxx;
      expv[56] = 53'hxxxxxxxxxxxxxx;
      expv[57] = 53'hxxxxxxxxxxxxxx;
      expv[58] = 53'hxxxxxxxxxxxxxx;
      expv[59] = 53'hxxxxxxxxxxxxxx;
      expv[60] = 53'hxxxxxxxxxxxxxx;
      expv[61] = 53'hxxxxxxxxxxxxxx;
      expv[62] = 53'hxxxxxxxxxxxxxx;
      expv[63] = 53'hxxxxxxxxxxxxxx;
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

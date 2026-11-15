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

  rtlpp_11228 dut (
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
    stim[0] = 122'h0a56558d6eb414156b1ac0edc69d454;
    stim[1] = 122'h35af6a1107258f98fb8b0191ba409bb;
    stim[2] = 122'h10c918a4774c58b9f955158478964b8;
    stim[3] = 122'h15108901f09f68cc087879a9ad649cf;
    stim[4] = 122'h18076c5ec5e3d6eea6e5b0e5dae8249;
    stim[5] = 122'h234dbd8f15b89ce7357c208ce331558;
    stim[6] = 122'h08024a1fa7839d1001c4756b34e3cc6;
    stim[7] = 122'h1f4240f1c1fe610106596edd20c0084;
    stim[8] = 122'h1e1dc5b26dc4113794f25aa1bdbda68;
    stim[9] = 122'h2daf1bfb5ea0457863e3970fad7b6f4;
    stim[10] = 122'h023f6da878826d4995e94793493c6de;
    stim[11] = 122'h0baf44bc96525de591523d81bf870c7;
    stim[12] = 122'h1974305e0472e3b995f59e09054f7ac;
    stim[13] = 122'h293bec1abf681c1595805887c61f4d6;
    stim[14] = 122'h18687703e73b6a7c19db816e421be68;
    stim[15] = 122'h1ddcc6eb10f94466cde30a30a6120dc;
    stim[16] = 122'h1128e141ffeeaf5f82db7f9857c0952;
    stim[17] = 122'h2ada7d052324249068d336779da4a12;
    stim[18] = 122'h23a196cdb933c9bd78ca14866659855;
    stim[19] = 122'h3706723dc2d8fe40fb408d37d2d573e;
    stim[20] = 122'h307449dbacb8c8c5fdf0b0337be20f1;
    stim[21] = 122'h145e914db6e54df3989d399a52a9795;
    stim[22] = 122'h02f7539419634ec0a0f650f8dcdfc01;
    stim[23] = 122'h30379817fb67a1c9ca61f6b8afae439;
    stim[24] = 122'h2e1acee8913bdc06094ba2fc08d4b0a;
    stim[25] = 122'h05041064bb3363e90ce5e60f8f4b42c;
    stim[26] = 122'h393492bc341e6e52e9ef15a4c19bd69;
    stim[27] = 122'h2116f60a8234a1c32d555c21f9696e5;
    stim[28] = 122'h050d2c21640d39bc7a744dbcbd7334b;
    stim[29] = 122'h0f6ae07628c66eff7effc96a01c473b;
    stim[30] = 122'h108503f3d6d068447c7d4c6137e94cc;
    stim[31] = 122'h0310a21299464316cc47d9cba4c49dc;
    stim[32] = 122'h34ac8277de9d7973356ddb86556e503;
    stim[33] = 122'h2717dc4b7195ed6c97de0fba48b0f1c;
    stim[34] = 122'h2ef8a0e34109e1e422df45bf5589b76;
    stim[35] = 122'h36149dd7c1c0765a195088155e63d05;
    stim[36] = 122'h20b2f55ffd5615b9c4f2936ca1f9dea;
    stim[37] = 122'h005e39a04337512b374c701baa5a193;
    stim[38] = 122'h230ffa4a0a2780d2f7c94525649aaa8;
    stim[39] = 122'h10f637c6f0977b87c461ed1e73ccc7f;
    stim[40] = 122'h0609058e83e1616cdb4f4ecd5327f1f;
    stim[41] = 122'h0cf56478615505cebb56ca71dcd565d;
    stim[42] = 122'h332b88ae59e09714f67119b21ee7280;
    stim[43] = 122'h276119bb2699737127e8781319eb9de;
    stim[44] = 122'h26791b07dd68d81a2c48d031a9918cb;
    stim[45] = 122'h24c93dc9d9e26a161f60c8e4fe3b010;
    stim[46] = 122'h2a0eb7d90ec558003c73bc8867b0781;
    stim[47] = 122'h14fd4d4b2780bb0b49eae24d26ec1ec;
    stim[48] = 122'h09a26b08252f892acc6336c04c0368b;
    stim[49] = 122'h031dcb9e327cc48a2af72f75804d293;
    stim[50] = 122'h1018f9181f9d6b97b2e6b6be17f2c19;
    stim[51] = 122'h14dec67dfe6ff0f967ef87e928ee086;
    stim[52] = 122'h0249d591b04b3a117665d4dcf6c863e;
    stim[53] = 122'h1986d8417cbfc254bddb9e81d209b1a;
    stim[54] = 122'h16c5fb6dc1d96854e453f5d2c0ccf2e;
    stim[55] = 122'h2b3a5f7faff7aea813dfd9ff043d518;
    stim[56] = 122'h04db5fb09632879a60ec75e2c2dd813;
    stim[57] = 122'h0a63bbbacd311f32ed4ce2c888f8789;
    stim[58] = 122'h1c38f95898e029cbb06dfbc199390b3;
    stim[59] = 122'h2f2fbb8e3b6edab3e766b8223eb20f6;
    stim[60] = 122'h31c27bf47fd6b4e778d9b93ea2bab30;
    stim[61] = 122'h0d5b4b862c9a23033df4a84b0cdb105;
    stim[62] = 122'h0ea725aaf774b2b980591d3044144a7;
    stim[63] = 122'h2404a79ab80681f6936336112fd0563;
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
      expv[0] = 53'h00000000000000;
      expv[1] = 53'h00000000000000;
      expv[2] = 53'h00000000000000;
      expv[3] = 53'h00000000000000;
      expv[4] = 53'h00000000000000;
      expv[5] = 53'h00000000000000;
      expv[6] = 53'h00000000000000;
      expv[7] = 53'h00000000000000;
      expv[8] = 53'h00000000000000;
      expv[9] = 53'h00000000000000;
      expv[10] = 53'h00000000000000;
      expv[11] = 53'h00000000000000;
      expv[12] = 53'h00000000000000;
      expv[13] = 53'h00000000000000;
      expv[14] = 53'h00000000000000;
      expv[15] = 53'h00000000000000;
      expv[16] = 53'h00000000000000;
      expv[17] = 53'h00000000000000;
      expv[18] = 53'h00000000000000;
      expv[19] = 53'h00000000000000;
      expv[20] = 53'h00000000000000;
      expv[21] = 53'h00000000000000;
      expv[22] = 53'h00000000000000;
      expv[23] = 53'h00000000000000;
      expv[24] = 53'h00000000000000;
      expv[25] = 53'h00000000000000;
      expv[26] = 53'h00000000000000;
      expv[27] = 53'h00000000000000;
      expv[28] = 53'h00000000000000;
      expv[29] = 53'h00000000000000;
      expv[30] = 53'h00000000000000;
      expv[31] = 53'h00000000000000;
      expv[32] = 53'h00000000000000;
      expv[33] = 53'h00000000000000;
      expv[34] = 53'h00000000000000;
      expv[35] = 53'h00000000000000;
      expv[36] = 53'h00000000000000;
      expv[37] = 53'h00000000000000;
      expv[38] = 53'h00000000000000;
      expv[39] = 53'h00000000000000;
      expv[40] = 53'h00000000000000;
      expv[41] = 53'h00000000000000;
      expv[42] = 53'h00000000000000;
      expv[43] = 53'h00000000000000;
      expv[44] = 53'h00000000000000;
      expv[45] = 53'h00000000000000;
      expv[46] = 53'h00000000000000;
      expv[47] = 53'h00000000000000;
      expv[48] = 53'h00000000000000;
      expv[49] = 53'h00000000000000;
      expv[50] = 53'h00000000000000;
      expv[51] = 53'h00000000000000;
      expv[52] = 53'h00000000000000;
      expv[53] = 53'h00000000000000;
      expv[54] = 53'h00000000000000;
      expv[55] = 53'h00000000000000;
      expv[56] = 53'h00000000000000;
      expv[57] = 53'h00000000000000;
      expv[58] = 53'h00000000000000;
      expv[59] = 53'h00000000000000;
      expv[60] = 53'h00000000000000;
      expv[61] = 53'h00000000000000;
      expv[62] = 53'h00000000000000;
      expv[63] = 53'h00000000000000;
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

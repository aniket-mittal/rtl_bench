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

  rtlpp_05452 dut (
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
    stim[0] = 122'h130fce279c03f07ba2abab3b70d589b;
    stim[1] = 122'h28cbeb43b5431e862d2c29fc526289c;
    stim[2] = 122'h35c67178484b9dc2e7ee204cfb7d79e;
    stim[3] = 122'h0918eac10546278b257e3b47f573fc2;
    stim[4] = 122'h3db6dc160f9b1fe3d05c1d4e1321003;
    stim[5] = 122'h2bbb9d52ea503593b07457862e649af;
    stim[6] = 122'h24338847223c5e8290e61bae58f9236;
    stim[7] = 122'h23c3ab2bb92beb497af8a583af4967c;
    stim[8] = 122'h1878fcdc0a2369522cf1c4dc6da789e;
    stim[9] = 122'h2ff9b52291b8050e42ed090421ddab6;
    stim[10] = 122'h285e3dab5a57a6cf977384dddfc1c3f;
    stim[11] = 122'h32243eebe211c1e30561b2375687641;
    stim[12] = 122'h2f9b393afaf5ba2909c23b1a95d443c;
    stim[13] = 122'h27d9073ee71b874da1fc0bc6c54f31e;
    stim[14] = 122'h2b988ef9e23715fdff6f20d88f32065;
    stim[15] = 122'h26fb5bac683f71af72df382021e6a0f;
    stim[16] = 122'h1459a80602b82340755c0dd5ac457cd;
    stim[17] = 122'h3b237bd74c629b960575bc67b6b6f0d;
    stim[18] = 122'h3563c033b3410fde4049e4a123d226c;
    stim[19] = 122'h0ab7d5a43e5cd016c4ed206d47af9fb;
    stim[20] = 122'h044b0617bd9d7ee2734890502fb37cf;
    stim[21] = 122'h19b0bda70365296ddd4691e3ba7fc99;
    stim[22] = 122'h165507c0b26e2322eef8d816dd35496;
    stim[23] = 122'h24804dd850257d80e0e9bc5000be102;
    stim[24] = 122'h16de46f23ca5dcbac8c7bea6bff04ab;
    stim[25] = 122'h19c87681576cd5e5b4db8af4510b634;
    stim[26] = 122'h2608343ef6c10a329048c38aedf9359;
    stim[27] = 122'h0f3232a21bf2455710650ec06c5151a;
    stim[28] = 122'h3fb513e3af7b5b244c7a6623b351fb5;
    stim[29] = 122'h09d417679f96604b48e47eb5d2eefe4;
    stim[30] = 122'h01eba436f53905f93561ddfa2fcdf42;
    stim[31] = 122'h0b2136d6a964bd88e5fb95e09082960;
    stim[32] = 122'h203c471ed3bdb61331e0727ea86eac6;
    stim[33] = 122'h061deb10d90d759786dc9199b820fdb;
    stim[34] = 122'h0acd8d74816001a9d2521a08693aa31;
    stim[35] = 122'h20b84374c0ccec628c66fc84cd3aab8;
    stim[36] = 122'h0f75dbee18a025f2c9f7d355e9c08c8;
    stim[37] = 122'h029569d38463d39c7bdb4110f5c0953;
    stim[38] = 122'h2562baf1accaf16443cc48e067fa42c;
    stim[39] = 122'h3b76854dd5a975451351d720fc1b058;
    stim[40] = 122'h30e07d5f129d76d3a7cf19c503c77d8;
    stim[41] = 122'h17ce6fabf073047b297bacea62d2c64;
    stim[42] = 122'h3b8a84c434db4b1020ca8a848278d54;
    stim[43] = 122'h3a0656a702d2aa915e5f40da1a64f9f;
    stim[44] = 122'h0308f6a750bd5c5a3379607b98a7081;
    stim[45] = 122'h0bb81851fdd93fc7f553431b6cbdca8;
    stim[46] = 122'h0ca168919ab0901a4b66cf7aab64034;
    stim[47] = 122'h0d228c427750be01df52ef3da6ce44e;
    stim[48] = 122'h119618e83cb40462cfececbd307189f;
    stim[49] = 122'h0869e2145b459830f2648ad7a87e928;
    stim[50] = 122'h14e25ed5cd836a3ccae3a11b80ef216;
    stim[51] = 122'h110de2df6d9473beaee0e4de9634ac4;
    stim[52] = 122'h27c8851a8148b19803ccf1ba29cbd5e;
    stim[53] = 122'h02231875914d4a30cb6d57da6464cf1;
    stim[54] = 122'h0b5a631ed0f95a2f7bdf2a978908ffb;
    stim[55] = 122'h1e0d2ecae34e781705d8df2246d2095;
    stim[56] = 122'h0c75608be08d5181bdc9c18d0a34c98;
    stim[57] = 122'h070cbbb3c260ed2d9466c7d87b47dda;
    stim[58] = 122'h08209450f45fee6e1bcec6ff6bb7e15;
    stim[59] = 122'h13f93e056a9a6135ef768b722fbd7e7;
    stim[60] = 122'h10060ecdc39286794cc33e1dd7d9f20;
    stim[61] = 122'h2f8224a22b023f9d90cf26c35367d50;
    stim[62] = 122'h02e51a0e4981d58d29de5bdd46d00a3;
    stim[63] = 122'h2f5f1d459209f579927bee07c6ec85c;
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
      expv[2] = 53'h00000000004000;
      expv[3] = 53'h00000000004000;
      expv[4] = 53'h00000000004000;
      expv[5] = 53'h00000000004000;
      expv[6] = 53'h00000000004000;
      expv[7] = 53'h00000000004000;
      expv[8] = 53'h00000000004000;
      expv[9] = 53'h00000000004000;
      expv[10] = 53'h00000000004000;
      expv[11] = 53'h00000000004000;
      expv[12] = 53'h00000000004000;
      expv[13] = 53'h00000000004000;
      expv[14] = 53'h00000000004000;
      expv[15] = 53'h00000000004000;
      expv[16] = 53'h00000000004000;
      expv[17] = 53'h00000000004000;
      expv[18] = 53'h00000000004000;
      expv[19] = 53'h00000000004000;
      expv[20] = 53'h00000000004000;
      expv[21] = 53'h00000000004000;
      expv[22] = 53'h00000000004000;
      expv[23] = 53'h00000000004000;
      expv[24] = 53'h00000000004000;
      expv[25] = 53'h00000000004000;
      expv[26] = 53'h00000000004000;
      expv[27] = 53'h00000000004000;
      expv[28] = 53'h00000000004000;
      expv[29] = 53'h00000000004000;
      expv[30] = 53'h00000000004000;
      expv[31] = 53'h00000000004000;
      expv[32] = 53'h00000000004000;
      expv[33] = 53'h00000000004000;
      expv[34] = 53'h00000000004000;
      expv[35] = 53'h00000000004000;
      expv[36] = 53'h00000000004000;
      expv[37] = 53'h00000000004000;
      expv[38] = 53'h00000000004000;
      expv[39] = 53'h00000000004000;
      expv[40] = 53'h00000000004000;
      expv[41] = 53'h00000000004000;
      expv[42] = 53'h00000000004000;
      expv[43] = 53'h00000000004000;
      expv[44] = 53'h00000000004000;
      expv[45] = 53'h00000000004000;
      expv[46] = 53'h00000000004000;
      expv[47] = 53'h00000000004000;
      expv[48] = 53'h00000000004000;
      expv[49] = 53'h00000000004000;
      expv[50] = 53'h00000000004000;
      expv[51] = 53'h00000000004000;
      expv[52] = 53'h00000000004000;
      expv[53] = 53'h00000000004000;
      expv[54] = 53'h00000000004000;
      expv[55] = 53'h00000000004000;
      expv[56] = 53'h00000000004000;
      expv[57] = 53'h00000000004000;
      expv[58] = 53'h00000000004000;
      expv[59] = 53'h00000000004000;
      expv[60] = 53'h00000000004000;
      expv[61] = 53'h00000000004000;
      expv[62] = 53'h00000000004000;
      expv[63] = 53'h00000000004000;
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

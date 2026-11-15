// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 160;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_026564 dut (
    .instruction(in_vec[159:128]),
    .Rs(in_vec[127:96]),
    .Rt(in_vec[95:64]),
    .PCplusOne(in_vec[63:32]),
    .SE_Imm(in_vec[31:0]),
    .ID_PC(out_vec[32:1]),
    .PCSource(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 160'h2ec22c70a3d704aac765e969f769c95375f808c5;
    stim[1] = 160'h1fa8c312b832a600904f3a85cadff84058f23985;
    stim[2] = 160'hc0c61a3f3939d0289505af17880fca5902aca533;
    stim[3] = 160'h29b3523b76fe9c3e51b4b795385c35327e5cad11;
    stim[4] = 160'hf4e2c302f2a98085a57701bd3addfd7170eb5497;
    stim[5] = 160'h41d82025087bccd93c845718b5ab35da79fe5ea2;
    stim[6] = 160'h9b4c158a0f62b8cab72f410a3d1e673b7c76e60c;
    stim[7] = 160'h9e88945b19561fd930739e6e1f39869b9a00118b;
    stim[8] = 160'hc2bafa7ef5416993403f1027b67efe6a442ce350;
    stim[9] = 160'he12d477893e519fc418cd80e8a4741c6a8622883;
    stim[10] = 160'h514936c1a93adc8087e26949b766c54d3eb8d642;
    stim[11] = 160'ha180069546625a5d9a8aa818da2e168d2c1425aa;
    stim[12] = 160'heee3cafa9d0ab20f813748019dfc4e7b6f6000c5;
    stim[13] = 160'hccd027cacc68d73f07bcbe8c4c1807dcc3781722;
    stim[14] = 160'hd3e7c84294607fe100f842f34b4ced85fb2c098a;
    stim[15] = 160'hd3071938d57ef25473f62bda655114b1cd7b05c9;
    stim[16] = 160'h97892ca42d6098c09dde4eee7342a8a264d8c988;
    stim[17] = 160'hd98de416e14da2caafe8b9bdd87450f672cd247f;
    stim[18] = 160'h0faae6e80a54e2fdffbafb8691edb816bdad32c2;
    stim[19] = 160'hf9e3a0333c2d7b2e405128495fe563694d68f82e;
    stim[20] = 160'h83b1fc0d892f33091b10e4226f365430fe6c4d27;
    stim[21] = 160'h3f2e04e8ea98a52b4d970e94793259f034b8ddd8;
    stim[22] = 160'h1f4ed9adf297492b12dba4c869783ede1b9c051d;
    stim[23] = 160'ha20eb924b72021dd519e3ee4e5c1ad73ebd52bf0;
    stim[24] = 160'h94d88c39629b7d10395812954da647b8026f03ea;
    stim[25] = 160'ha08c49bd65329e11769ed24a9e6eec59962525e1;
    stim[26] = 160'ha253668d2496cbaaa7e931830a0fc3e4e887b34a;
    stim[27] = 160'h73bf64026cd015a5962e02600b332ce1703e316a;
    stim[28] = 160'h47ff58e2a1561fdbb8a46afc7f026753e72d4d2e;
    stim[29] = 160'hc1cf87f7bf516c83144790646a34a1c893914398;
    stim[30] = 160'h4292ab3b88061196797175eece2c1bca02adc121;
    stim[31] = 160'h81b305d3331d259af9083530a6e831839f81243d;
    stim[32] = 160'h377b0e55cdac44a9ad31dcac5fed4380663246f5;
    stim[33] = 160'haa1af42c3e3fe75c923a4b1d3e438a6354a1122b;
    stim[34] = 160'hbf201392cafa0a2bbbf218d559911ab36d480ab0;
    stim[35] = 160'h89034cd5f0c7ff80edd3cd46544d2fd2641b1f51;
    stim[36] = 160'h68297a363c317c41704c595f53abbd4c18e1ccd5;
    stim[37] = 160'ha2ab536876a09c18319c3dee8ce0e26fac48667e;
    stim[38] = 160'h3d49d3d1b46009f91862747520c0d1f8947d1a12;
    stim[39] = 160'h1a6679e531b49704827942a60a6d7c215781dbdb;
    stim[40] = 160'h72e1d1340ffedee4d72b9a0d97911b04efc7f4a8;
    stim[41] = 160'h99065755a7a3c732ae722c4a1d3309a8126c4fa3;
    stim[42] = 160'h86d1eccb0d1121d1edd6b95cea90e4bce404fd20;
    stim[43] = 160'hed31c9a549229196b87c10034614d8a8cb7c6439;
    stim[44] = 160'hb3335efa46d95103f54bbfe48626cb2e38af34eb;
    stim[45] = 160'h441d6d312fc964f2752c2cce929ff83bbf3c86fe;
    stim[46] = 160'h1eeca012b591252ba33d517d89ddeefc1d16d95e;
    stim[47] = 160'h4b3145181aaeeb24cb606f65a9c5fbe6467d15f1;
    stim[48] = 160'h2ecd02b47c51045910f41fd51e90a606debd532b;
    stim[49] = 160'h7e5d1293765f730676cf44db85b488526278e252;
    stim[50] = 160'hc2a17432f8e19b82d0e652bc70b12961e5a994b3;
    stim[51] = 160'h384b97d42f8df977ce9db84e21c0ad3e36ec826e;
    stim[52] = 160'h5a4d54977f2ca6053c2cc94fb29e17bb96aa7552;
    stim[53] = 160'h1579bf4e459136ffa29f59bf2016dedc7f0631f8;
    stim[54] = 160'h3e1afe93810e39f5a931c77334ea6b650223e1e5;
    stim[55] = 160'h8a0d0b533531b56aa5737a0b5da8a801ac2961cf;
    stim[56] = 160'h030d7ea09306160f67e3bfbd08d4f865180a7b1b;
    stim[57] = 160'h83ea966e101b7f276f21adfb3213797e3a234eae;
    stim[58] = 160'h0071a38c51c4774c05ea4191527b5ca34c0108f3;
    stim[59] = 160'h145c1a4cd9c6ce4979240b17856b2a9d62bbc17d;
    stim[60] = 160'h97f036b2bebfce21e8c98512a998c6f845749579;
    stim[61] = 160'ha4911de19ab65cff77645414c8c487727753941b;
    stim[62] = 160'h517de1f2ba4708226721dc01b7c2a3df6b045f5c;
    stim[63] = 160'h06b5cacc4a303d36001f7da48b1152204e6ba961;
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
      expv[0] = 33'h1eed392a6;
      expv[1] = 33'h195bff080;
      expv[2] = 33'h1101f94b2;
      expv[3] = 33'h070b86a64;
      expv[4] = 33'h075bbfae2;
      expv[5] = 33'h16b566bb4;
      expv[6] = 33'h07a3cce76;
      expv[7] = 33'h03e730d36;
      expv[8] = 33'h16cfdfcd4;
      expv[9] = 33'h1148e838c;
      expv[10] = 33'h16ecd8a9a;
      expv[11] = 33'h1b45c2d1a;
      expv[12] = 33'h13bf89cf6;
      expv[13] = 33'h098300fb8;
      expv[14] = 33'h09699db0a;
      expv[15] = 33'h0caa22962;
      expv[16] = 33'h0e6855144;
      expv[17] = 33'h1b0e8a1ec;
      expv[18] = 33'h123db702c;
      expv[19] = 33'h0bfcac6d2;
      expv[20] = 33'h0de6ca860;
      expv[21] = 33'h0f264b3e0;
      expv[22] = 33'h0d2f07dbc;
      expv[23] = 33'h1cb835ae6;
      expv[24] = 33'h09b4c8f70;
      expv[25] = 33'h13cddd8b2;
      expv[26] = 33'h0141f87c8;
      expv[27] = 33'h0166659c2;
      expv[28] = 33'h0fe04cea6;
      expv[29] = 33'h0d4694390;
      expv[30] = 33'h19c583794;
      expv[31] = 33'h14dd06306;
      expv[32] = 33'h0bfda8700;
      expv[33] = 33'h07c8714c6;
      expv[34] = 33'h0b3223566;
      expv[35] = 33'h0a89a5fa4;
      expv[36] = 33'h0a7577a98;
      expv[37] = 33'h119c1c4de;
      expv[38] = 33'h04181a3f0;
      expv[39] = 33'h014daf842;
      expv[40] = 33'h12f223608;
      expv[41] = 33'h03a661350;
      expv[42] = 33'h19d2bc3b9;
      expv[43] = 33'h08c29b150;
      expv[44] = 33'h10c4d965c;
      expv[45] = 33'h1253ff076;
      expv[46] = 33'h113bbddf8;
      expv[47] = 33'h1538bf7cc;
      expv[48] = 33'h03d214c0c;
      expv[49] = 33'h10b6910a4;
      expv[50] = 33'h0e16252c2;
      expv[51] = 33'h043815a7c;
      expv[52] = 33'h1653c2f76;
      expv[53] = 33'h0402dbdb8;
      expv[54] = 33'h069d4d6ca;
      expv[55] = 33'h0bb515002;
      expv[56] = 33'h011a9f0ca;
      expv[57] = 33'h06426f2fc;
      expv[58] = 33'h0a4f6b946;
      expv[59] = 33'h10ad6553a;
      expv[60] = 33'h153318df0;
      expv[61] = 33'h191890ee4;
      expv[62] = 33'h16f8547be;
      expv[63] = 33'h115ae5661;
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

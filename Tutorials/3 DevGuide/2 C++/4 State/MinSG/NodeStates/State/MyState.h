/*
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Stanislaw Eppinger (eppinger@mail.uni-paderborn.de)
 PADrend Version 1.0.0
*/
#ifndef MINSG_MYSTATE_H
#define MINSG_MYSTATE_H

#include "../../Core/States/State.h"

namespace MinSG {

    class MyState : public State {
      PROVIDES_TYPE_NAME(MyState)
    public:
      State::stateResult_t doEnableState(FrameContext & context, Node * node, const RenderParam & rp) override;
      void doDisableState(FrameContext & context,Node *, const RenderParam & rp) override;
      MyState * clone() const override;
    };

}

#endif /* MINSG_MYSTATE_H */
